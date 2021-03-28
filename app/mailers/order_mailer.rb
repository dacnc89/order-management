class OrderMailer < ApplicationMailer

  def order_updated_email
    @order = params[:order]
    @user = @order.user

    mail(to: @user.email, subject: "You got a new order updated!")
  end
end
