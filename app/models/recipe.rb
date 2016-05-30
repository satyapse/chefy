class Recipe < ActiveRecord::Base
	belongs_to :cheff
	has_many :likes, dependent: :destroy
  has_many :comments  
	validates :cheff_id, presence: true
	validates :name, presence: true, length: { minimum: 5, maximum: 100 }
    validates :summary, presence: true, length: { minimum: 10, maximum: 150 }
    validates :description, presence: true, length: { minimum: 20, maximum: 500 }
    mount_uploader :picture, PictureUploader
    # validate :picture_size
    
    def thumbs_up_total
      self.likes.where(like: true).size
    end
    def thumbs_down_total
      self.likes.where(like: false).size
    end

    

    # private
    #   def picture_size
    #   	if picture.size > 20.megabytes
    #   		errors.add(:picture, "should be less than 20MB")
    #   	end
    #   end
    def self.search(search)
  if search   
   self.where(["name LIKE ?","%#{search}%"])
  else
    find(:all)
  end
 end

end