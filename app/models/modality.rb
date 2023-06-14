class Modality < ApplicationRecord
  belongs_to :accommodation
  belongs_to :exchange
  has_one :review

  enum progress: { pending: 0, next: 1, confirmed: 2 }, _default: 0
  STEPS = ["duration", "dates", "keys", "petsitting", "transportation", "others"]

  def find_last_input(test_final)
    if self.progress == "pending"
      @occurence = test_final.index { |i| i.nil? || i == "" }
    elsif self.progress == "next"
      @occurence = test_final.index { |i| i.nil? || i == "" } - 1
    elsif self.progress == "confirmed"
      @occurence = test_final.index { |i| i.nil? || i == "" } - 1
    else
      raise
    end
    @occurence
  end
end
