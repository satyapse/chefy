class AddAdminToCheffs < ActiveRecord::Migration
  def change
  	add_column :cheffs, :admin, :boolean, default: false
  end
end
