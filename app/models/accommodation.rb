class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :modalities, dependent: :destroy
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :nb_of_guests, presence: true
  validates :nb_of_bedrooms, presence: true
  validates :nb_of_beds, presence: true
  validates :nb_of_bathrooms, presence: true
  validates :garden, inclusion: { in: [true, false] }
  validates :swimming_pool, inclusion: { in: [true, false] }
  validates :balcony, inclusion: { in: [true, false] }
  validates :nb_of_tvs, presence: true
end
