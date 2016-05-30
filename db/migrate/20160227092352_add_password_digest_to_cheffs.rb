class AddPasswordDigestToCheffs < ActiveRecord::Migration
  def change
  	add_column :cheffs, :password_digest, :string
  end
end
