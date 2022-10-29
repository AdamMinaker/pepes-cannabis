json.extract! product, :id, :name, :sku, :price, :description, :image, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
