class Brand < ApplicationRecord
    #belongs_to :client
    has_many :products, dependent: :destroy

    # Validações
    validates :name, presence: true, uniqueness: { scope: :client_id, message: 'já existe para este cliente' }
    validates :status, inclusion: { in: [true, false], message: 'deve ser ativo ou inativo' }

end