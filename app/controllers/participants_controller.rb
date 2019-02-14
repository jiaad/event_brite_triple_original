class ParticipantsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def index
    @event = Event.find(params[:event_id]).attendances
    @particip = Attendance.find_by(params[:attendances_id])
    puts "="*90
  puts      @particip = Attendance.find_by(params[:attendances_id])

  puts "="*90

  end

  def new
    @event = Event.new
  end
  
  def create
    # Amount in cents
 
    
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

      @attendance = Attendance.new(stripe_customer_id: customer.id, event_id: params[:event_id] , attendant_id: current_user.id)
      puts "="*90
      puts params[:event_id]
      puts current_user.id
      puts "="*90

      if charge.save
        if @attendance.save
          flash[:success]="bien joué ma couille"
          redirect_to root_path
          return
        else
          flash[:error]="t un mauvais jack"
        end
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
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
