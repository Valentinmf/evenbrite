class AttendancesController < ApplicationController
  
  def index
  end
  
  def new
    @event = Event.find(params[:event_id])
  end
  
  def create
    # Amount in cents
    @event = Event.find(params[:event_id])
    @amount = @event.price * 100
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  if Attendance.create(user_id: current_user.id, event_id: params[:event_id], stripe_customer_id: Stripe::Customer.retrieve(customer.id))
    redirect_to event_path(params[:event_id])
    flash[:sucess] = "Vous êtes bien inscrit à l'événement"
  end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_event_attendance_path
  end
end
