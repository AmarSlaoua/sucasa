class AddStatusToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :status, :integer
  end
end
