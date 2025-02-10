class ContractProduct < ApplicationRecord
  belongs_to :contract
  belongs_to :product
end
