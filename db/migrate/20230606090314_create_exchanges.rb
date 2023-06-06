class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.date :check_in
      t.date :check_out
      t.integer :duration

      t.timestamps
    end
  end
end
