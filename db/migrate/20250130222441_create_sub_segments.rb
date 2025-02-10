class CreateSubSegments < ActiveRecord::Migration[8.0]
  def change
    create_table :sub_segments do |t|
      t.string :sub_segment_name
      t.boolean :status
      t.references :segment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
