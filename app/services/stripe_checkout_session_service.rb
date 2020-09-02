class StripeCheckoutSessionService
  def call(event)

    user = User.find_by(checkout_session_id: event.data.object.id)

    user.update(premium: true)

    puts "==============="
    p user
    # order = Order.find_by(checkout_session_id: event.data.object.id)
    # order.update(state: 'paid')
  end
end
