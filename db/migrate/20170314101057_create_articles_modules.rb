class CreateArticlesModules < ActiveRecord::Migration
  def change
    create_table :articles_modules do |t|
      t.references :house_module, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.integer :drawing_position

      t.timestamps null: false
    end
  end
end
