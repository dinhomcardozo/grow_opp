class Quote < ApplicationRecord
  belongs_to :opportunity
  has_many :quote_products
  has_many :products, through: :quote_products
end
