json.extract! sales_order, :id, :opportunity_id, :total_price, :created_at, :updated_at
json.url sales_order_url(sales_order, format: :json)
