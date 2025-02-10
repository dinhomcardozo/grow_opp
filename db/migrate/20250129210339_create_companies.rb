class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :cnpj
      t.string :phone
      t.string :address
      t.integer :address_number
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
