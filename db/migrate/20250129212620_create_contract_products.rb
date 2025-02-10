class CreateContractProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :contract_products do |t|
      t.references :contract, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
