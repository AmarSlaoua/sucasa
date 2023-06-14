class ModalitiesController < ApplicationController
  def create
  end

  def update
    @modality = Modality.find(params[:id])
    @exchange = @modality.exchange
    @other_user = @exchange.find_other_user(current_user)
    @modality_form = Modality::STEPS
    @attributes = @modality.attributes

    if params[:modality]["progress"].present?
      params[:modality]["progress"] = params[:modality]["progress"].to_i
      @modality.progress = params[:modality]["progress"].to_i
    end

    @test_final = @modality_form.map do |element|
      @attributes[element]
    end
    @occurence = @modality.find_last_input(@test_final)

    if params[:modality][:dates] != "" && !params[:modality][:dates].nil?
      check_in, check_out = params[:modality][:dates].split(' to ')
      @modality.check_in = Date.parse(check_in)
      @modality.check_out = Date.parse(check_out)
    end

    if @modality.update(params_modalities)
      if @modality.confirmed?
        # @message = Message.new(exchange: @exchange, content: render_to_string(partial: "messages/confirmation_message", locals: { modality: @modality, user: @other_user}))
        @message = Message.new(exchange: @exchange, user: current_user, content: render_to_string(partial: "messages/confirmation_message", locals: {modality: @modality, occurence: @occurence, other_user: @other_user} ))
        @message.save
        @message.display_both!
        ExchangeChannel.broadcast_to(
          @exchange,
          {
            confirmation_message: @message,
            modality_form: render_to_string(partial: "modalities/modality_form",
                                            locals: { modality: @modality,
                                                      user: current_user,
                                                      occurence: @occurence })
          }
        )

        @modality.progress = 0
        @modality.pending!
      else
        @message_for_current_user = Message.new(user: current_user, exchange: @exchange, content: render_to_string(partial: "messages/offer_message_content", locals: { occurence: @occurence, modality: @modality, other_user: @other_user }))
        @message_for_current_user.save
        @message_for_current_user.display_to_message_user!

        # @category_value = 1
        @message_for_other_user = Message.new(user: current_user, category: 1, exchange: @exchange, occurence: @occurence, content: render_to_string(partial: "messages/offer_message_content", locals: { occurence: @occurence, modality: @modality, other_user: @other_user }))
        @message_for_other_user.save
        @message_for_other_user.display_to_other_user!

        ExchangeChannel.broadcast_to(
          @exchange,
          {
            message_for_current_user: render_to_string(partial: "messages/message", locals: { message: @message_for_current_user, modality: nil, occurence: @occurence }),
            message_for_other_user: render_to_string(partial: "messages/message", locals: { message: @message_for_other_user, modality: @modality, occurence: @occurence }),
            modality_form: render_to_string(partial: "modalities/modality_form",
                                                      locals: { modality: @modality,
                                                                user: @other_user,
                                                                occurence: @occurence }),
            current_user_id: current_user.id
          }
        )
      end
      head :ok
      # redirect_to edit_exchange_path(@modality.exchange)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def progress
  end

  private

  def params_modalities
    params.require(:modality).permit(
      :accommodation_id,
      :exchange_id,
      :duration,
      :check_in,
      :check_out,
      :keys,
      :petsitting,
      :transportation,
      :others,
      :progress,
      :dates
    )
  end
end
