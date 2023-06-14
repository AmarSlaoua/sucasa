class Message < ApplicationRecord
  belongs_to :user
  belongs_to :exchange

  validates :content, presence: true

  enum category: { not_form: 0, form: 1 }, _default: 0
end
