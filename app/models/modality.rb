class Modality < ApplicationRecord
  belongs_to :accommodation
  belongs_to :exchange
  has_one :review

  enum progress: { pending: 0, next: 1, confirmed: 2, finished: 3 }, _default: 0
  STEPS = ["duration", "dates", "keys", "petsitting", "transportation", "others"]
  TIPS = ["💡 Agree with your buddy and choose a travel duration",
          "💡 Decide with your buddy and choose the dates for your exchange",
          "💡 Explain where you would like to leave the keys (at the office, in-person, to a trusted neighbor, on a key lockbox...)",
          "💡 Can you take care of your host's pet ?",
          "💡 If you wish to provide transportation options to your guest, you can discuss it and specify it here (bicycle, car, etc.)",
          "💡 Add any additional information here"]

  def find_last_input
    test_final = STEPS.map { |element| attributes[element] }
    index = test_final.index(&:blank?)
    return test_final.count if index.nil?
    return index if pending? || confirmed?
    return index - 1 if next?
  end
end
