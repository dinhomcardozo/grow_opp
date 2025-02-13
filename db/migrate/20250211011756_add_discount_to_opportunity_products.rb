class AddDiscountToOpportunityProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :opportunity_products, :discount, :decimal, precision: 10, scale: 2
  end
end