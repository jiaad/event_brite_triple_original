class ParticipantsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]


  def index
  end

  def create
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def edit
  end

  def show

  end

  def update
  end

  def destroy
  end


end
