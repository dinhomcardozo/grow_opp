class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :type
      t.string :description, limit: 200
      t.decimal :price, precision: 10, scale: 2 #10 digitos, 2 casas decimais
      t.boolean :status
      t.integer :license

      t.timestamps
    end
  end
end
