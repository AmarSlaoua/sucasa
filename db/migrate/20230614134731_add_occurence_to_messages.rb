class AddOccurenceToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :occurence, :integer
  end
end