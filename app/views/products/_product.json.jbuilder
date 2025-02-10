json.extract! product, :id, :type, :description, :price, :status, :license, :created_at, :updated_at
json.url product_url(product, format: :json)
