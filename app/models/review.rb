class Review < ApplicationRecord
  belongs_to :user
  belongs_to :modality

  validates :content, presence: true
end
