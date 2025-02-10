class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.references :opportunity, null: false, foreign_key: true
      t.decimal :total_price

      t.timestamps
    end
  end
end
