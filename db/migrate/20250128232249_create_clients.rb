class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :cnpj
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :address_number

      t.timestamps
    end
  end
end
