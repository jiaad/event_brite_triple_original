class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:description])
  end


  
  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice]= "connecte toi pour rejoindre l'évent"
      redirect_to new_user_registration_path 
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
  def user_admin_permisssion
    @event = Event.find(params[:id])
    if current_user.id != @event.admin_id
      flash[:danger]= "degage escroc"
      redirect_to root_path
    end
  end

end
