json.extract! company, :id, :company_name, :cnpj, :phone, :address, :address_number, :country, :state, :city, :created_at, :updated_at
json.url company_url(company, format: :json)
