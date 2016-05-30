class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, only: [:edit, :update, :like, :destroy, :new]
  # before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, except: [:like, :show, :index]
 

def index
  if params[:search].present? 
    @recipes = Recipe.search(params[:search])
  else    
	@recipes = Recipe.all
  end
end

def show
	# @recipe = Recipe.find(params[:id])
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = Recipe.new(recipe_params)
  @recipe.cheff = current_user

  if @recipe.save
    flash[:success] = "Your recipe was created successfully!"
    redirect_to recipes_path
  else
  	render :new
  end
end

def edit
  # @recipe = Recipe.find(params[:id])
end

def update
 # @recipe = Recipe.find(params[:id])
 if @recipe.update(recipe_params)
   flash[:success] = "Your recipe was updated successfully!"
    redirect_to recipe_path(@recipe)
 else
 	render :edit
 end
end

def like
  @recipe = Recipe.find(params[:id])
  like = Like.create(like: params[:like], cheff: current_user, recipe: @recipe)
  if like.valid?
  flash[:success] = "Your selection was successful"
  redirect_to :back
else
	flash[:danger] = "You can only like/dislike a recipe once"
	redirect_to :back
end
end



def destroy
 Recipe.find(params[:id]).destroy
 flash[:success] = "Recipe Deleted"
 redirect_to recipes_path
end

private
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end

def set_recipe
@recipe = Recipe.find(params[:id])
end

#   def require_same_user
#   if current_user != !current_user.admin?
#     flash[:danger] = "You can only edit your own profile"
#     redirect_to recipes_path
#   end
# end

def admin_user
 redirect_to recipes_path unless current_user.admin?

end

end
