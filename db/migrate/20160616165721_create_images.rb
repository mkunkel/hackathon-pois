class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :poi_id
      t.text :ocr_text
      t.string :luna_id

      t.timestamps
    end
  end
end
