json.extract! client, :id, :cnpj, :company_name, :email, :phone, :country, :state, :city, :address, :address_number, :created_at, :updated_at
json.url client_url(client, format: :json)
