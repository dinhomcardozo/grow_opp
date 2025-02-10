class Opportunity < ApplicationRecord
    has_many :opportunity_products, dependent: :destroy
    has_many :products, through: :opportunity_products
  
    belongs_to :contact
    belongs_to :company
  
    # Validações
    validates :notes, presence: true

    private
end