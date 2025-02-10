class CreateTaxRegimes < ActiveRecord::Migration[8.0]
  def change
    create_table :tax_regimes do |t|
      t.string :tax_regime_name
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
