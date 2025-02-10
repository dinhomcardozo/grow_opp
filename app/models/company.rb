class Company < ApplicationRecord
    has_many :contacts, dependent: :nullify, through: :company_contacts
    has_many :opportunities
    has_many :opportunities, through: :opportunity_products
    #belongs_to :client - reativar quando ativar authentication
    has_many :contracts, through: :opportunities
    has_many :sales_orders, through: :opportunities
    has_many :quotes, through: :opportunities
end