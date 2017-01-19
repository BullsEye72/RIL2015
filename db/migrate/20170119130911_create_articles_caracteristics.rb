class CreateArticlesCaracteristics < ActiveRecord::Migration
  def change
    create_table :articles_caracteristics do |t|
      t.references :article, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
