class UpdateMessagesTable < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :user_id, :bigint, null: true
  end
end
