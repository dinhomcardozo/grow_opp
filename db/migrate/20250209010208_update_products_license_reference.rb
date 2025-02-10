class UpdateProductsLicenseReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :license, :string
    add_reference :products, :license, foreign_key: true, type: :bigint
  end
end