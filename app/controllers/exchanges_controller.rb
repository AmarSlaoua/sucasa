require 'date'

class ExchangesController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:exchange][:accommodation_id])
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      @exchange.create_modality(current_user.accommodation)
      @exchange.create_modality(@accommodation)
      redirect_to edit_exchange_path(@exchange)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exchange = Exchange.find(params[:id])
    @message = Message.new
    @exchange_modalities = Modality.where(exchange: @exchange)
    @my_modality = @exchange.find_my_modality(current_user)
    @other_user_modality = @exchange.find_other_user_modality(current_user)
    @other_user = @exchange.find_other_user(current_user)
    find_my_exchanges
    @exchanges_infos = Exchange.build_exchanges_info(current_user)


    @modality_form = Modality::STEPS
    @attributes = @my_modality.attributes

    @test_final = @modality_form.map do |element|
      @attributes[element]
    end

    @occurence = @my_modality.find_last_input(@test_final)
    progress_toggle
  end

  def show
    @exchange = Exchange.find(params[:id])
    @review = Review.new
    @date_today = Date.today
    @other_user_modality = @exchange.find_other_user_modality(current_user)
    accommodation = @other_user_modality.accommodation
    @markers = [{
      lat: accommodation.latitude,
      lng: accommodation.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { accommodation: accommodation }),
      marker_html: render_to_string(partial: "marker", locals: { accommodation: accommodation })
    }]
  end

  private

  def find_my_exchanges
    @my_exchanges = current_user.accommodation.modalities.map(&:exchange)
  end

  def exchange_params
    params.require(:exchange).permit(
      :check_in,
      :check_out,
      :duration
    )
  end

  def progress_toggle
    if @my_modality.progress == "pending"
      @my_modality.progress = "next"
    end
  end

  # def find_last_input
  #   if @my_modality.progress == "pending"
  #     @occurence = @test_final.index { |i| i.nil? || i == "" }
  #   elsif @my_modality.progress == "next"
  #     @occurence = @test_final.index { |i| i.nil? || i == "" } - 1
  #   else
  #     raise
  #   end
  # end
end
