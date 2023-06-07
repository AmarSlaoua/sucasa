class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
    if params[:query].present?
      @accommodations = @accommodations.where("address ILIKE ?", "%#{params[:query]}%").all
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def new
  end

  def edit
    @accommodation = current_user.accommodation
  end

  def create
  end

  def update
    @accommodation = current_user.accommodation
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation, notice: "Les informations du logement ont été mises à jour."
    else
      render :edit
    end
  end

  def destroy

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
                                          :balcony)
  end
end
