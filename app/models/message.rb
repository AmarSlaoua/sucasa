class Message < ApplicationRecord
  belongs_to :user
  belongs_to :exchange

  validates :content, presence: true
end
