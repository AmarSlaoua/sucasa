class Modality < ApplicationRecord
  belongs_to :accommodation
  belongs_to :exchange
  has_one :review
end
