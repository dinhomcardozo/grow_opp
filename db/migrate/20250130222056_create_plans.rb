class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.boolean :status, default: true
      t.integer :plan_duration
      t.decimal :plan_price

      t.timestamps
    end
  end
end
