class HotelsController < ApplicationController
  before_action :set_hotel, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

def index
	@hotels = Hotel.all
end

def show
	# @recipe = Recipe.find(params[:id])
end

def new
  @hotel = Hotel.new
end

def create
  @hotel = Hotel.new(hotel_params)
  @hotel.cheff = current_user

  if @hotel.save
    flash[:success] = "Your recipe was created successfully!"
    redirect_to hotels_path
  else
  	render :new
  end
end

def edit
  # @recipe = Recipe.find(params[:id])
end

def update
 # @recipe = Recipe.find(params[:id])
 if @hotel.update(hotel_params)
   flash[:success] = "Your recipe was updated successfully!"
    redirect_to hotels_path(@hotel)
 else
 	render :edit
 end
end

# def like
#   @recipe = Recipe.find(params[:id])
#   like = Like.create(like: params[:like], cheff: current_user, recipe: @recipe)
#   if like.valid?
#   flash[:success] = "Your selection was successful"
#   redirect_to :back
# else
# 	flash[:danger] = "You can only like/dislike a recipe once"
# 	redirect_to :back
# end
# end

private
  def hotel_params
    params.require(:hotel).permit(:name, :summary, :description, :picture)
  end

def set_hotel
@hotel = Hotel.find(params[:id])
end

  def require_same_user
  if current_user != @hotel.cheff
    flash[:danger] = "You can only edit your own profile"
    redirect_to hotels_path
  end
end

end
