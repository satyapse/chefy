class Like < ActiveRecord::Base
 belongs_to :cheff
 belongs_to :recipe

 validates_uniqueness_of :cheff, scope: :recipe
end