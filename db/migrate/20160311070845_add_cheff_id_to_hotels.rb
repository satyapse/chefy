class AddCheffIdToHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :cheff_id, :integer
  end
end
