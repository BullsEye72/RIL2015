class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_due_calc
      t.references :supplier, index: true, foreign_key: true
      t.references :quote, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
