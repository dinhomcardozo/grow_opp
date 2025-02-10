class SalesOrder < ApplicationRecord
  belongs_to :opportunity
  has_many :sales_order_products
  has_many :products, through: :sales_order_products
end