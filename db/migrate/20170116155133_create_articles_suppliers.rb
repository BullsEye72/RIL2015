class CreateArticlesSuppliers < ActiveRecord::Migration
  def change
    create_table :articles_suppliers do |t|
      t.references :supplier, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.string :supplier_reference
      t.decimal :price

      t.timestamps null: false
    end
  end
end
