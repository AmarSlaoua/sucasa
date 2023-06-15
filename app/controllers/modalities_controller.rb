class ModalitiesController < ApplicationController
  def create
  end

  def update
    @modality = Modality.find(params[:id])
    @exchange = @modality.exchange
    @other_user = @exchange.find_other_user(current_user)

    @occurence = @modality.find_last_input
    if @modality.update(params_modalities)
      if @modality.confirmed?
        actions_after_confirmed_modality
      else
        actions_after_pending_modality
      end
      head :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def progress
  end

  private

  def actions_after_confirmed_modality
    @other_modality = @exchange.modalities.where.not(id: @modality.id).first
    if [0, 1].include? @occurence
      @other_modality.update(Modality::STEPS[@occurence].to_sym => @modality[Modality::STEPS[@occurence]])
    end

    @message = Message.create(exchange: @exchange,
                              user: current_user,
                              status: :display_both,
                              content: render_to_string(partial: "messages/confirmation_message"))

    @my_modality = @exchange.find_my_modality(current_user)
    @other_user_modality = @exchange.find_other_user_modality(current_user)

    @my_occurence = @my_modality.find_last_input
    @other_user_occurence = @other_user_modality.find_last_input
    # raise
    ExchangeChannel.broadcast_to(
      @exchange,
      {
        confirmation_message: @message,
        modality_form: render_to_string(partial: "modalities/modality_form",
                                        locals: { modality: @my_modality,
                                                  user: current_user,
                                                  occurence: @my_occurence }),
        other_modality_form: render_to_string(partial: "modalities/modality_form",
                                              locals: { modality: @other_user_modality,
                                                        user: @other_user,
                                                        occurence: @other_user_occurence }),
        current_user_id: current_user.id,
        occurence: @occurence
      }
    )
    if @occurence < Modality::STEPS.count
      @modality.pending!
    else
      @modality.finished!
    end
  end

  def actions_after_pending_modality
    @my_modality = @exchange.find_my_modality(current_user)
    @other_user_modality = @exchange.find_other_user_modality(current_user)

    @my_occurrence = @my_modality.find_last_input
    @other_user_occurence = @other_user_modality.find_last_input

    @message_for_current_user = Message.create(user: current_user,
                                            exchange: @exchange,
                                            content: render_to_string(partial: "messages/offer_message_content",
                                                                      locals: { occurence: @occurence,
                                                                                modality: @modality,
                                                                                other_user: @other_user }))
    @message_for_current_user.display_to_message_user!


    @message_for_other_user = Message.create(user: current_user,
                                          category: :form,
                                          status: :display_to_other_user,
                                          exchange: @exchange,
                                          occurence: @occurence,
                                          content: render_to_string(partial: "messages/offer_message_content",
                                                                    locals: { occurence: @occurence,
                                                                              modality: @modality,
                                                                              other_user: @other_user }))
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



  def params_modalities
    m_params = params.require(:modality).permit(
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

    m_params[:progress] = m_params[:progress].to_i if m_params[:progress].present?

    if !m_params[:dates].blank?
      check_in, check_out = params[:modality][:dates].split(' to ')
      m_params[:check_in] = Date.parse(check_in)
      m_params[:check_out] = Date.parse(check_out)
    end

    m_params
  end
end
