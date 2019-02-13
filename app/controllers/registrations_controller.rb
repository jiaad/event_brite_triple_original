class RegistrationsController < ApplicationController
  # def cancel
  # end

  # def new
  #   @user = User.new
  # end
  # def create
  #   @user = User.new(first_name:params[:first_name], last_name:params[:last_name], description:params[:description],email:params[:email], password:params[:password],)

  #   if @user.save
  #     redirect_to '/'
      
  #   end
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
