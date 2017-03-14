class CreateModuleRanges < ActiveRecord::Migration
  def change
    create_table :module_ranges do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
