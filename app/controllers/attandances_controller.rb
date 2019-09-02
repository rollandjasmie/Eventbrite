class AttandancesController < ApplicationController
  def index
  	 @event = Event.find(params[:event_id])
 @attendance = @event.users
  end

  def new
  	@event=Event.find(params[:event_id])
  	@Attandance =Attandance.new
  end

def create
  

  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd',
  })
@att =Attandance.create(stripe_customer_id: customer.id,user_id:current_user.id,event_id: params[:event_id])

  redirect_to "/events/#{params[:event_id]}"
rescue Stripe::CardError => e
  flash[:error] = e.message
  render "new"

end
def free
  @tt = Attandance.create(user_id:current_user.id,event_id:params[:event_id])
  redirect_to "/events/#{params[:event_id]}"
end
end
