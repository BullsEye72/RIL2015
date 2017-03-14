class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :thumbnail_path
      t.string :file_path
      t.integer :drawing_type
      t.string :internal_reference

      t.timestamps null: false
    end
  end
end
