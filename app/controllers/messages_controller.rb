class MessagesController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @message = Message.new(message_params)
    @message.exchange = @exchange
    @message.user = current_user
    @message.display_both!
    if @message.save
      @exchanges_infos = Exchange.build_exchanges_info(current_user)
      ExchangeChannel.broadcast_to(
        @exchange,
        { message: render_to_string(partial: "message", locals: { message: @message, modality: nil }),
          current_user_id: current_user.id
          #ajouter modality_form ici pour que js
        }
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
