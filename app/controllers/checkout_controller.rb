class CheckoutController < ApplicationController
  def create
      orderables = @cart.order_items.all

      item_list = []

      orderables.each do |orderable|
        item_list.append(
          {
            price_data: {
              currency: 'cad',
              unit_amount: orderable.product.price.to_i,
              product_data: {
                name: orderable.product.name
              },
              tax_behavior: 'exclusive'
            },
            quantity: orderable.quantity
          }
        )
      end

      json_item_list = item_list.to_json

      # Setting up Stripe session for payment
      if user_signed_in?
      session =
        Stripe::Checkout::Session.create({
          line_items: JSON.parse(json_item_list),
          automatic_tax: {
            enabled: true
          },
          mode: "payment",
          billing_address_collection: 'required',

          shipping_address_collection: {
            allowed_countries: ['CA'],
          },
          invoice_creation: {enabled: true},
          customer_email: current_user.email,
          success_url: orders_url,
          cancel_url: root_url
        })
      else
        session =
        Stripe::Checkout::Session.create({
          line_items: JSON.parse(json_item_list),
          automatic_tax: {
            enabled: true
          },
          mode: "payment",
          billing_address_collection: 'required',

          shipping_address_collection: {
          allowed_countries: ['CA'],
        },
          invoice_creation: {enabled: true},
          success_url: orders_url,
          cancel_url: root_url
        })

      end

      redirect_to session.url, allow_other_host: true, protocol: :all, data: { turbo: false }
  end
end
