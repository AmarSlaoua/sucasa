class CreateModalities < ActiveRecord::Migration[7.0]
  def change
    create_table :modalities do |t|
      t.integer :duration
      t.date :check_in
      t.date :check_out
      t.string :keys
      t.boolean :petsitting
      t.string :transportation
      t.string :others
      t.integer :progress
      t.references :accommodation, null: false, foreign_key: true
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
