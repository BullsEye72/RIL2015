class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :thumbnail_path
      t.string :file_path
      t.integer :drawing_type #0: Module / 1: Product
      t.string :internal_reference

      t.timestamps null: false
    end
  end
end
