class CreateCaracteristics < ActiveRecord::Migration
  def change
    create_table :caracteristics do |t|
      t.string :name
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
