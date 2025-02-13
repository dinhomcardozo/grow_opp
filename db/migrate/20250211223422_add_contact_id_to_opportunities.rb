class AddContactIdToOpportunities < ActiveRecord::Migration[8.0]
  def change
    add_reference :opportunities, :contact, null: false, foreign_key: true
  end
end
