class CreatePaymentStates < ActiveRecord::Migration
  def change
    create_table :payment_states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
