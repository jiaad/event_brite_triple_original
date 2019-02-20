class Admin::EventsController < ApplicationController
  def index
    @event = Event.all.where(admin_validation: false)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(event_params)

    redirect_to event_path
    end
  end

  def destroy
    @event = Event.destroy(params[:id])
    flash[:success] = "Your event has been deleted"
    redirect_to admin_root_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :price, :date_time,:duration,:location, :description )

  end


end
