class Admin::UsersController < ApplicationController
  before_action :is_admin?
  def index
    @users = User.all.where(is_admin: false)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Utilisateur modifié!"
      redirect_to admin_users_path
    else
      render :edit
    end 
   end

  def destroy
    @user = User.find(params[:id])
    if 
      @user.destroy
      flash[:success] = "tu l'a annihillé"
      redirect_to admin_root_path
  end
end
private

def user_params
  params.require(:user).permit(:first_name, :last_name, :description, :is_admin)
end

def is_admin?
  unless current_user.is_admin
    redirect_to root_path
    
  end
end
end