class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :modalities

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :nb_of_guests, presence: true
  validates :nb_of_bedrooms, presence: true
  validates :nb_of_beds, presence: true
  validates :nb_of_bathrooms, presence: true
  validates :garden, presence: true
  validates :swimming_pool, presence: true
  validates :balcony, presence: true
  validates :nb_of_tvs, presence: true
end
