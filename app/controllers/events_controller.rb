class EventsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]
  before_action :user_admin_permisssion, :only =>[:edit, :update]


  def index
    @event = Event.all.where(admin_validation:true)
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(start_date: params[:start_date] , duration: params[:duration]  , title: params[:title]  , description: params[:description] , price:params[:price]  , location: params[:location] , admin: current_user, admin_validation:false)
    if @event.save
      flash[:success] = "Event Created"
      redirect_to '/'
    else
      puts "="*90
      puts @event.errors.full_messages 
      puts "="*90
    end
  end

  
    def show
      @event = Event.find(params[:id])
    end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, :success => "Your event has been deleted"
  end


  private
    # Using a private method to encapsulate the permissible parameters is
    # a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def event_params
      params.require(:event).permit(:title, :price, :date_time,:duration,:location, :description )
    end

end
