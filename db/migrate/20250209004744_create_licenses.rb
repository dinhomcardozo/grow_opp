class CreateLicenses < ActiveRecord::Migration[6.1]
  def change
    create_table :licenses do |t|
      t.string :description, null: false
      t.integer :license_years, default: 0
      t.integer :license_months, default: 0
      t.integer :license_days, default: 0
      t.boolean :status, null: false, default: true

      # Adicionar timestamps
      t.timestamps
    end
  end
end