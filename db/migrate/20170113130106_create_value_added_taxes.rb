class CreateValueAddedTaxes < ActiveRecord::Migration
  def change
    create_table :value_added_taxes do |t|
      t.decimal :value
      t.string :name

      t.timestamps null: false
    end
  end
end
