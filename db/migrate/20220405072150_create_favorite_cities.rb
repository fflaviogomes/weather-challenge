class CreateFavoriteCities < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_cities do |t|
      t.string :city

      t.timestamps
    end
  end
end
