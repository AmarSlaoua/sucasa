class Company < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :industry, presence: true
end
