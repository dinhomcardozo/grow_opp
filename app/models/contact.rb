class Contact < ApplicationRecord
    belongs_to :client 
    belongs_to :company#, optional: true
    has_many :company_contacts
    has_many :opportunities
    
    validates :first_name, :last_name, presence: true
    validates :role, inclusion: { in: ->(contact) { contact.class.roles }, allow_nil: true }
    validates :department, inclusion: { in: ->(contact) { contact.class.departments }, allow_nil: true }
    validates :company_id, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    # Método para retornar as opções válidas de "role"
    def self.roles
      [
        'Consultor', 'Assistente', 'Analista', 'Supervisor', 'Coordenador', 
        'Especialista', 'Gerente', 'Diretor', 'CEO'
      ]
    end
  
    # Método para retornar as opções válidas de "department"
    def self.departments
      [
        'Administração Geral', 'Comercial', 'Compliance', 'Contabilidade', 'Customer Success',
        'Estoque e Almoxarifado', 'Exportação', 'Financeiro', 'Fiscal', 'Jurídico', 'Logística',
        'Marketing', 'Operações/Produção', 'Pesquisa e Desenvolvimento (P&D)', 'Compras', 'Qualidade',
        'Recursos Humanos (RH)', 'Relações Públicas', 'Responsabilidade Social e Sustentabilidade',
        'Saúde e Segurança no Trabalho (SST)', 'Suporte Técnico', 'Tecnologia da Informação (TI)',
        'Tesouraria', 'Vendas', 'Outros'
      ]
    end
end
