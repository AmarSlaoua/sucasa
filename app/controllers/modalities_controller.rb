class ModalitiesController < ApplicationController
  def create
  end

  def update
    @modality = Modality.find(params[:id])
    if params[:modality][:check_in] != ""
      check_in, check_out = params[:modality][:check_in].split(' to ')
      @modality.check_in = Date.parse(check_in)
      @modality.check_out = Date.parse(check_out)
    end
    if @modality.update(params_modalities)
      redirect_to edit_exchange_path(@modality.exchange)
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
      :progress
    )

  end
end
