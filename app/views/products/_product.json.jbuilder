json.extract! product, :id, :product_type, :description, :price, :status, :license_id, :created_at, :updated_at
json.url product_url(product, format: :json)