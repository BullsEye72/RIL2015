class CreateMargins < ActiveRecord::Migration
  def change

    create_table :margins do |t|
      t.string :name
      t.decimal :value
      t.timestamps null: false
    end

    create_table :margins_quotes, id: false do |t|
      t.belongs_to :margins, index: true
      t.belongs_to :quotes, index: true
    end

  end
end
