class AddModalitiesToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :modality, foreign_key: true
  end
end
