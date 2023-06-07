class Review < ApplicationRecord
  belongs_to :user
  belongs_to :modality, dependent: :destroy

  validates :content, presence: true
end
