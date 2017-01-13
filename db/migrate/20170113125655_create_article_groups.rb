class CreateArticleGroups < ActiveRecord::Migration
  def change
    create_table :article_groups do |t|
      t.string :name
      t.references :article_group, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
