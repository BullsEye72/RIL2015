class CreateDrawingTypes < ActiveRecord::Migration
  def change
    create_table :drawing_types do |t|
      t.string :name
      t.references :drawing_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
