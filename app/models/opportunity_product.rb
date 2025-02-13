class OpportunityProduct < ApplicationRecord
  belongs_to :opportunity
  belongs_to :product

  # Validações
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :product, presence: true

  before_validation :set_price_from_product
  before_save :calculate_values
  before_save :subtotal_price

  def subtotal_price
    return 0 if product.nil? || product.price.nil? || quantity.nil?
    (product.price * quantity) - (discount || 0)
  end

  private

  def set_price_from_product
    self.price ||= product.price if product.present?
  end

  def calculate_values
    return unless product.present?
    self.subtotal_price = (product.price * quantity) - (discount || 0)
    self.total_price = self.subtotal_price
  end
end
