class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :stage_name
      t.boolean :status, default: true

      t.timestamps
    end
  end
end