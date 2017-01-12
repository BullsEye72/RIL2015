class CreateConstructionStates < ActiveRecord::Migration

  def change

    create_table :construction_states do |t|
      t.string :name
      t.text :description
      t.decimal :value

      t.timestamps null: false
    end

    create_table :construction_states_quotes, id: false do |t|
      t.belongs_to :construction_states, index: true
      t.belongs_to :quotes, index: true
    end

  end
end
