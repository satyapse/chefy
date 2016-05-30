class LoginsController < ApplicationController

def new
end

def create
  cheff = Cheff.find_by(email: params[:email])
   if cheff && cheff.authenticate(params[:password])
   	session[:cheff_id] = cheff.id
   	flash[:success] = "You are logged in"
   	redirect_to recipes_path
   else
   	flash.now[:danger] = "Your email address or password doesnot match"
   	render 'new'
   end
end

def destroy
  session[:cheff_id] = nil
  flash[:success] = "You have logged out"
  redirect_to root_path
end


end