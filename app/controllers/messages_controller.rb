class MessagesController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @message = Message.new(message_params)
    @message.exchange = @exchange
    @message.user = current_user
    if @message.save
      @exchanges_infos = Exchange.build_exchanges_info(current_user)
      ExchangeChannel.broadcast_to(
        @exchange,
        { message: render_to_string(partial: "message", locals: { message: @message }),
          exchanges_infos: render_to_string(partial: "exchanges/exchanges_infos", locals: { exchanges_infos: @exchanges_infos, exchange: @exchange}) }
      )
      head :ok
    else
      render "exchanges/edit", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
