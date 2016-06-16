class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.text :address
      t.string :category
      t.string :luna_id

      t.timestamps
    end
  end
end
