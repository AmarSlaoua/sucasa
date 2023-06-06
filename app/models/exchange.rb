class Exchange < ApplicationRecord
  has_many :modalities
  has_many :messages
end
