class AddCategoryToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :category, :integer
  end
end
