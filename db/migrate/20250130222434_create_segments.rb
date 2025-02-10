class CreateSegments < ActiveRecord::Migration[8.0]
  def change
    create_table :segments do |t|
      t.string :segment_name
      t.boolean :status

      t.timestamps
    end
  end
end
