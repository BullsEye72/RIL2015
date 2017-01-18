class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.string :name
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
