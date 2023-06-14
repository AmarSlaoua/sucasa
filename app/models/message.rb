class Message < ApplicationRecord
  belongs_to :user
  belongs_to :exchange

  validates :content, presence: true

  enum category: { not_form: 0, form: 1 }, _default: 0
  enum status: { display_both: 0, display_to_message_user: 1, display_to_other_user: 2 }, _default: 0

end
