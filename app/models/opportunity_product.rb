class OpportunityProduct < ApplicationRecord
  belongs_to :opportunity
  belongs_to :product

  # Validações
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  # Calcula o subtotal
  def subtotal_price
    (product.price * quantity) - (discount || 0)
  end
end