class Exchange < ApplicationRecord
  has_many :modalities, dependent: :destroy
  has_many :messages, dependent: :destroy

  def create_modality(accommodation)
    Modality.create(accommodation: accommodation, exchange: self)
  end

  def find_my_modality(current_user)
    Modality.find_by("exchange_id = ? AND accommodation_id = ?", self.id, current_user.accommodation.id)
  end

  def find_other_user(current_user)
    Modality.find_by("exchange_id = ? AND accommodation_id != ?", self.id, current_user.accommodation.id).accommodation.user
  end

  def find_other_user_modality(current_user)
    Modality.find_by("exchange_id = ? AND accommodation_id != ?", self.id, current_user.accommodation.id)
  end


  def self.build_exchanges_info(current_user)
    my_exchanges = current_user.accommodation.exchanges.sort_by { |exchange|
      exchange.messages.last&.created_at || exchange.created_at
    }.reverse
    my_exchanges.map do |exchange|
      another_modality = Modality.find_by("exchange_id = ? AND accommodation_id != ?", exchange.id, current_user.accommodation.id)
      another_user = another_modality.accommodation.user
      last_message = exchange.messages.last&.content || "Send the first message!"
      [exchange, another_user, last_message]
    end
  end
end
