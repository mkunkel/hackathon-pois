class AddNameToPois < ActiveRecord::Migration
  def change
    add_column :pois, :name, :string
  end
end
