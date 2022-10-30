json.extract! user, :id, :email, :password, :name, :billing_address, :shipping_address, :country, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
