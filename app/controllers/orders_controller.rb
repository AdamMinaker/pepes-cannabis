class OrdersController < ApplicationController
  def show
    rawInvoices = Stripe::Invoice.list({limit: 3})

    if user_signed_in?
      @invoices = rawInvoices.select { |invoice| invoice.customer_email == current_user.email }
    else
      @invoices = []
    end
  end
end
