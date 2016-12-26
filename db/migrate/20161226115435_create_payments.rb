class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :quote, index: true, foreign_key: true
      t.decimal :payment
      t.decimal :payment_date
      t.references :payment_state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
