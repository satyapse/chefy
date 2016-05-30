class Comment < ActiveRecord::Base
 belongs_to :cheff
 belongs_to :recipe

 # 
# validates :cheff_id, presence: true
# validates :recipe_id, presence: true

# validates :body, presence: true, length: { minimum: 5, maximum: 100 }

end