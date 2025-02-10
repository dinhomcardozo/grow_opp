class Product < ApplicationRecord
    self.inheritance_column = nil # Para não usar STI

    #belongs_to :client #inativo por enquanto para pós autenticação
    belongs_to :license, optional: true
    has_many :opportunity_products
    has_many :opportunities, through: :opportunity_products
    has_many :quote_products
    has_many :quotes, through: :quote_products
    has_many :sales_order_products
    has_many :sales_orders, through: :sales_order_products
    has_many :contract_products
    has_many :contracts, through: :contract_products

  # Validações
    validates :product_type, presence: true, inclusion: { in: ['Digital', 'Físico', 'Serviço'] }
    validates :description, presence: true, length: { maximum: 200 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :status, inclusion: { in: [true, false] }

    # Callbacks
    before_save :convert_description_to_uppercase

    # Atributos virtuais (não persistidos no banco de dados)
    attr_accessor :license_years, :license_months, :license_days

    private
    # Converte a descrição para maiúsculo
    def convert_description_to_uppercase
        self.description = description.upcase if description.present?
    end
end