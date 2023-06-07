class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @review.modality = Modality.find(params[:modality_id])
    @review.user = current_user
    if @review.save
      redirect_to exchange_path(@review.modality.exchange)
    else
      render :new, :unprocessable_entity
    end
  end

  def update
  end

  private

  def reviews_params
    params.require(:review).permit(:content)
  end
end
