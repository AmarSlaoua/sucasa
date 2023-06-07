class ExchangesController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:exchange][:accommodation_id])
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      @modality_current_user = Modality.new(
        accommodation_id: current_user.accommodation.id,
        exchange_id: @exchange.id
      )
      @modality_other_user = Modality.new(
        accommodation_id: @accommodation.id,
        exchange_id: @exchange.id
      )
      if @modality_other_user.save && @modality_current_user.save
        redirect_to edit_exchange_path(@exchange)
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exchange = Exchange.find(params[:id])
    # @modality_current_user = Modality.where(exchange: @exchange).sample
    @exchange_modalities = Modality.where(exchange: @exchange)
  end

  def show
    @review = Review.new
    # @my_modality = Modality.where(exchange: Exchange.find(params[:id]), accommodation: current_user.accommodation)
    @other_user_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", Exchange.find(params[:id]).id, current_user.accommodation.id)
  end

  private

  def exchange_params
    params.require(:exchange).permit(
      :check_in_date,
      :check_out_date,
      :duration
    )
  end
end
