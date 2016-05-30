class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
    	t.string :name
    	t.text :summary
    	t.text :description
    	t.timestamps
    end
  end
end
