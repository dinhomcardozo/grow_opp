class Contract < ApplicationRecord
  belongs_to :opportunity
  has_many :contract_products
  has_many :products, through: :contract_products
end