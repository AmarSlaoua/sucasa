class Modality < ApplicationRecord
  belongs_to :accommodation
  belongs_to :exchange
  has_one :review

  enum progress: { pending: 0, next: 1, confirmed: 2 }, _default: 0
  STEPS = ["duration", "dates", "keys", "petsitting", "transportation", "others"]
  TIPS = ["💡 Agree with your buddy and choose a travel duration",
          "💡 Decide with your buddy and choose the dates for your exchange",
          "💡 Explain where you would like to leave the keys (at the office, in-person, to a trusted neighbor, on a key lockbox...)",
          "💡 Can you take care of your host's pet ?",
          "💡 If you wish to provide transportation options to your guest, you can discuss it and specify it here (bicycle, car, etc.)",
          "💡 Add any additional information here"]

  def find_last_input(test_final)
    if self.pending?
      @occurence = test_final.index(&:blank?)
    elsif self.next?
      @occurence = test_final.index(&:blank?) - 1
    elsif self.confirmed?
      @occurence = test_final.index(&:blank?)
    else
      raise
    end
    @occurence
  end
end
