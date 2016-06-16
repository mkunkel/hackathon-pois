class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :poi_id
      t.text :text
      t.string :luna_id

      t.timestamps
    end
  end
end
