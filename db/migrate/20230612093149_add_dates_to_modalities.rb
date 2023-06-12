class AddDatesToModalities < ActiveRecord::Migration[7.0]
  def change
    add_column :modalities, :dates, :string
  end
end
