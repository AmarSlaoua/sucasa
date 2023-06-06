class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true
  validates :industry, presence: true

  has_one_attached :photo
end
