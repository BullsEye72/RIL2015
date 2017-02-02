class RenameArticleCaracteristicToArticleUnit < ActiveRecord::Migration
  def change
    rename_table :articles_caracteristics, :article_units
  end
end
