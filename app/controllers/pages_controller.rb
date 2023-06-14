class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @accommodations = Accommodation.all.sample(8)
    @accommodations_beds = Accommodation.where("nb_of_beds > ?", 3).sample(8)
  end
end
