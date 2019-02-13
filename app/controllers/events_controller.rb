class EventsController < ApplicationController
  def index
    @event = Event.all
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(start_date: params[:start_date] , duration: params[:duration]  , title: params[:title]  , description: params[:description] , price:params[:price]  , location: params[:location] , admin: current_user)
    if @event.save
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
  end

  def update
  end

  def destroy
  end
end
