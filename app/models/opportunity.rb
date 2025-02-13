class Opportunity < ApplicationRecord
    has_many :opportunity_products, dependent: :destroy
    has_many :products, through: :opportunity_products
  
    belongs_to :contact, optional: true 
    belongs_to :company

    accepts_nested_attributes_for :opportunity_products, allow_destroy: true
  
    # Validações
    validates :description, presence: true

    # Inicializa 15 campos de produtos
    after_initialize do
        5.times { opportunity_products.build } if new_record?
    end
end