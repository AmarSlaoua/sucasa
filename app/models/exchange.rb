class Exchange < ApplicationRecord
  has_many :modalities, dependent: :destroy
  has_many :messages, dependent: :destroy
end
