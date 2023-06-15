class ModalitiesController < ApplicationController
  def create
  end

  def update
    @modality = Modality.find(params[:id])
    @exchange = @modality.exchange
    @other_user = @exchange.find_other_user(current_user)

    @my_modality = @exchange.find_my_modality(current_user)
    @other_user_modality = @exchange.find_other_user_modality(current_user)

    @modality_form = Modality::STEPS
    @attributes = @modality.attributes

    if params[:modality]["progress"].present?
      params[:modality]["progress"] = params[:modality]["progress"].to_i
      @modality.progress = params[:modality]["progress"].to_i
    end

    @test_final = @modality_form.map do |element|
      @attributes[element]
    end

    if !params[:modality][:dates].blank?
      check_in, check_out = params[:modality][:dates].split(' to ')
      @modality.check_in = Date.parse(check_in)
      @modality.check_out = Date.parse(check_out)
    end

    if @modality.update(params_modalities)
      @occurence = @modality.find_last_input(@test_final)

      puts "****************"
      puts @occurence
      puts "****************"

      if @modality.confirmed?
        @message = Message.new(exchange: @exchange, user: current_user, content: render_to_string(partial: "messages/confirmation_message", locals: {modality: @modality, occurence: @occurence, other_user: @other_user} ))
        @message.save
        @message.display_both!
        ExchangeChannel.broadcast_to(
          @exchange,
          {
            confirmation_message: @message,
            modality_form: render_to_string(partial: "modalities/modality_form",
                                            locals: { modality: @my_modality,
                                                      user: current_user,
                                                      occurence: @occurence }),
            other_modality_form: render_to_string(partial: "modalities/modality_form",
                                                  locals: { modality: @other_user_modality,
                                                            user: @other_user,
                                                            occurence: @occurence }),
            current_user_id: current_user.id
          }
        )
        @modality.pending!
      else
        @message_for_current_user = Message.new(user: current_user,
                                                exchange: @exchange,
                                                content: render_to_string(partial: "messages/offer_message_content",
                                                                          locals: { occurence: @occurence,
                                                                                    modality: @modality,
                                                                                    other_user: @other_user }))
        @message_for_current_user.save
        @message_for_current_user.display_to_message_user!

        @message_for_other_user = Message.new(user: current_user,
                                              category: 1,
                                              exchange: @exchange,
                                              occurence: @occurence,
                                              content: render_to_string(partial: "messages/offer_message_content",
                                                                        locals: { occurence: @occurence,
                                                                                  modality: @modality,
                                                                                  other_user: @other_user }))
        @message_for_other_user.save
        @message_for_other_user.display_to_other_user!

        ExchangeChannel.broadcast_to(
          @exchange,
          {
            message_for_current_user: render_to_string(partial: "messages/message",
                                                       locals: { message: @message_for_current_user,
                                                                 modality: nil,
                                                                 occurence: @occurence }),
            message_for_other_user: render_to_string(partial: "messages/message",
                                                     locals: { message: @message_for_other_user,
                                                               modality: @modality,
                                                               occurence: @occurence }),
            current_user_id: current_user.id
          }
        )
        @modality.next!
      end
      head :ok
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
