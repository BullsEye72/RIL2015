class CreateHouseModules < ActiveRecord::Migration
  def change
    create_table :house_modules do |t|
      t.references :module_range, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :default
      t.references :layout, index: true, foreign_key: true
      t.references :drawing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
