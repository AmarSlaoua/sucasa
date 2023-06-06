class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_reference :users, :company, null: false, foreign_key: true
    add_column :users, :job, :string
    add_column :users, :seniority, :string
  end
end
