json.extract! plan, :id, :plan_name, :status, :plan_duration, :plan_price, :created_at, :updated_at
json.url plan_url(plan, format: :json)
