class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @accommodations = Accommodation.all.sample(4)
    @accommodations_beds = Accommodation.where("nb_of_beds > ?", 3).sample(4)
  end
end
