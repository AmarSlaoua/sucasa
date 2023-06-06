class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :title
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :nb_of_guests
      t.integer :nb_of_bedrooms
      t.integer :nb_of_beds
      t.integer :nb_of_bathrooms
      t.boolean :garden
      t.boolean :swimming_pool
      t.boolean :balcony
      t.integer :nb_of_tvs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
