class CreateProductStates < ActiveRecord::Migration
  def change
    create_table :product_states do |t|
      t.string :name

      t.timestamps null: false
    end
    add_reference :products, :product_state
    remove_column :products, :default
  end
end
