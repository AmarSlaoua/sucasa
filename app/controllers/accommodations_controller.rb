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
  end

  def create
  end

  def update

  end

  def destroy

  end
end
