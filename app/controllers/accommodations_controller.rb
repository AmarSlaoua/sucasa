class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
    if params[:query].present?
      @accommodations = @accommodations.where("address ILIKE ?", "%#{params[:query]}%").all
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @exchange = Exchange.new
  end

  def edit
    @accommodation = current_user.accommodation
  end

  def update
    @accommodation = current_user.accommodation
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation, notice: "Infos has been updated !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:title,
                                          :description,
                                          :nb_of_guests,
                                          :nb_of_bathrooms,
                                          :nb_of_bedrooms,
                                          :nb_of_beds,
                                          :garden,
                                          :swimming_pool,
                                          :balcony,
                                           photos: [])
  end
end
