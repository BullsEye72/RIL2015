class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :default
      t.string :descriptif
      t.string :cctp_reference
      t.references :drawing, index: true, foreign_key: true
      t.references :quote, index: true, foreign_key: true
      t.references :modules, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
