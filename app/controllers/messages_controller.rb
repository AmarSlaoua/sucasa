class MessagesController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @message = Message.new(message_params)
    @message.exchange = @exchange
    @message.user = current_user
    if @message.save
      ExchangeChannel.broadcast_to(
        @exchange,
        render_to_string(partial: "message", locals: { message: @message })
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
