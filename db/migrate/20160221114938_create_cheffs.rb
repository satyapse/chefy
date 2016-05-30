class CreateCheffs < ActiveRecord::Migration
  def change
    create_table :cheffs do |t|
    	t.string :chefname
    	t.string :email
    	t.timestamps
    end
  end
end
