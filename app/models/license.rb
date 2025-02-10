class License < ApplicationRecord
    has_many :products, dependent: :nullify
  
    # Validações
    validates :description, presence: true, uniqueness: true
    validates :license_years, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
    validates :license_months, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
    validates :license_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
    validates :status, inclusion: { in: [true, false] }
  
    # Método para calcular a duração total em dias
    def total_duration_in_days
      (license_years.to_i * 365) + (license_months.to_i * 30) + license_days.to_i
    end

    # Método para formatar a descrição completa da licença
    def full_description
      "#{description} (#{total_duration_in_days} dias)"
    end
  end