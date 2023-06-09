class AccommodationsController < ApplicationController
  def index
    # @accommodations = Accommodation.all
    @accommodations = Accommodation.all
    if params[:query].present?
      @accommodations = @accommodations.near(params[:query].to_s, 2000).all
    end
    @markers = @accommodations.geocoded.map do |accommodation|
      {
        lat: accommodation.latitude,
        lng: accommodation.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { accommodation: accommodation }),
        marker_html: render_to_string(partial: "marker", locals: { accommodation: accommodation })
      }
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @exchange = Exchange.new
    @modalities = Modality.where("accommodation_id = ?", @accommodation.id)
    @reviews = []
    @modalities.each do |modality|
      @reviews << modality.review unless modality.review.nil?
    end
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
