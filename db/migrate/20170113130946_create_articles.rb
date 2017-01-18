class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.references :article_group, index: true, foreign_key: true
      t.references :value_added_tax, index: true, foreign_key: true
      t.string :reference
      t.text :description

      t.timestamps null: false
    end
  end
end
