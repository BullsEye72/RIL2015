class CreateModulesProducts < ActiveRecord::Migration
  def change
    create_table :modules_products do |t|
      t.references :house_module, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
