class CreateQuoteStates < ActiveRecord::Migration
  def change

    create_table :quote_states do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :quotes_quote_states, id: false do |t|
      t.belongs_to :quotes, index: true
      t.belongs_to :quote_states, index: true
    end

  end
end
