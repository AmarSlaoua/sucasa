require 'date'

# class ExchangesController < ApplicationController
#   def create
#     @accommodation = Accommodation.find(params[:exchange][:accommodation_id])
#     @exchange = Exchange.new(exchange_params)
#     if @exchange.save
#       @modality_current_user = Modality.new(
#         accommodation_id: current_user.accommodation.id,
#         exchange_id: @exchange.id
#       )
#       @modality_other_user = Modality.new(
#         accommodation_id: @accommodation.id,
#         exchange_id: @exchange.id
#       )
#       if @modality_other_user.save && @modality_current_user.save
#         redirect_to edit_exchange_path(@exchange)
#       else
#         render :new, status: :unprocessable_entity
#       end
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def edit
#     @exchange = Exchange.find(params[:id])
#     @message = Message.new
#     @exchange_modalities = Modality.where(exchange: @exchange)
#     @other_user = User.find(Modality.find_by("exchange_id = ? AND accommodation_id != ?", @exchange.id, current_user.accommodation.id).accommodation.user_id)
#     find_my_exchanges
#     @exchanges_infos = []
#     @my_exchanges.each do |exchange|
#       @another_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", exchange.id, current_user.accommodation.id)
#       @another_user = @another_modality.accommodation.user
#       exchange.messages.last.nil? ? @last_message = "Send the first message !" : @last_message = exchange.messages.last.content
#       @exchanges_infos << [exchange, @another_user, @last_message]
#     end
#   end

#   def show
#     @review = Review.new
#     # @my_modality = Modality.where(exchange: Exchange.find(params[:id]), accommodation: current_user.accommodation)
#     @other_user_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", Exchange.find(params[:id]).id, current_user.accommodation.id)
#   end

#   private

#   def exchange_params
#     params.require(:exchange).permit(
#       :check_in_date,
#       :check_out_date,
#       :duration
#     )
#   end

#   def find_my_exchanges
#     @my_exchanges = []
#     @modalities = current_user.accommodation.modalities
#     @modalities.each do |modality|
#       @my_exchanges << modality.exchange
#     end
#   end
# end


class ExchangesController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:exchange][:accommodation_id])
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      create_modality(current_user.accommodation.id)
      create_modality(@accommodation.id)
      redirect_to edit_exchange_path(@exchange)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exchange = Exchange.find(params[:id])
    @message = Message.new
    @exchange_modalities = Modality.where(exchange: @exchange)
    @my_modality = find_my_modality(@exchange.id)
    @other_user_modality = find_other_user_modality(@exchange.id)
    @other_user = find_other_user(@exchange)
    find_my_exchanges
    @exchanges_infos = build_exchanges_info

    @modality_form = MODALITY_FORM
    @attributes = @my_modality.attributes

    @test_final = @modality_form.map do |element|
      @attributes[element]
    end

    find_last_input
    progress_toggle
  end


  def show
    @review = Review.new
    # @my_modality = Modality.where(exchange: Exchange.find(params[:id]), accommodation: current_user.accommodation)
    # @other_user_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", Exchange.find(params[:id]).id, current_user.accommodation.id)
    @date_today = Date.today
    @other_user_modality = find_other_user_modality(params[:id])
    accommodation = @other_user_modality.accommodation
    @markers = [{
      lat: accommodation.latitude,
      lng: accommodation.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { accommodation: accommodation }),
      marker_html: render_to_string(partial: "marker", locals: { accommodation: accommodation })
    }]
  end

  private

  def exchange_params
    params.require(:exchange).permit(
      :check_in,
      :check_out,
      :duration
    )
  end

  def create_modality(accommodation_id)
    Modality.create(accommodation_id: accommodation_id, exchange_id: @exchange.id)
  end

  def find_other_user(exchange)
    Modality.find_by("exchange_id = ? AND accommodation_id != ?", exchange.id, current_user.accommodation.id).accommodation.user
  end

  def find_other_user_modality(exchange_id)
    Modality.find_by("exchange_id = ? AND accommodation_id != ?", exchange_id, current_user.accommodation.id)
  end

  def find_my_modality(exchange_id)
    Modality.find_by("exchange_id = ? AND accommodation_id = ?", exchange_id, current_user.accommodation.id)
  end

  def find_my_exchanges
    @my_exchanges = current_user.accommodation.modalities.map(&:exchange)
  end

  def build_exchanges_info
    @my_exchanges.map do |exchange|
      another_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", exchange.id, current_user.accommodation.id)
      another_user = another_modality.accommodation.user
      last_message = exchange.messages.last&.content || "Send the first message!"
      [exchange, another_user, last_message]
    end
  end

  def progress_toggle
    if @my_modality.progress == "pending"
      @my_modality.progress = "next"
    end
  end

  def find_last_input
    if @my_modality.progress == "pending"
      @occurence = @test_final.index { |i| i.nil? || i == "" }
    elsif @my_modality.progress == "next"
      @occurence = @test_final.index { |i| i.nil? || i == "" } - 1
    else
      raise
    end
  end

end
