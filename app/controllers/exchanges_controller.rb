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
end
