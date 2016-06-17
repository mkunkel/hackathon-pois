class AddCityAndStateToPoi < ActiveRecord::Migration
  def change
    add_column :pois, :city, :string
    add_column :pois, :state, :string
  end
end
