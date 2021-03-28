# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def order_updated_email
    order = Order.first
    OrderMailer.with(order: order).order_updated_email
  end

end
