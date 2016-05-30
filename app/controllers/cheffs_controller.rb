class CheffsController < ApplicationController
  before_action :set_cheff, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

def index
 @cheffs = Cheff.all
end

def new
	@cheff = Cheff.new 
end

def create
	@cheff = Cheff.new(cheff_params)
if @cheff.save
	flash[:success] = "Your account has been created succesfully"
	session[:cheff_id] = @cheff.id
	redirect_to recipes_path
else
	render'new'
end

end

def edit
	# @cheff = Cheff.find(params[:id])
end

def update
	# @cheff = Cheff.find(params[:id])
	if @cheff.update(cheff_params)
		flash[:success] = "Your profile has been updated succesfully"
		redirect_to cheff_path(@cheff)
	else
		render'edit'
	end
end

def show
 # @cheff = Cheff.find(params[:id])
end



private
def cheff_params
	params.require(:cheff).permit(:chefname, :email, :password)
end

def set_cheff
 @cheff = Cheff.find(params[:id])
end  

def require_same_user
	if current_user != @cheff
		flash[:danger] = "You can only edit your own profile"
		redirect_to root_path
	end
end




end