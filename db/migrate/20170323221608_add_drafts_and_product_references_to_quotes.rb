class AddDraftsAndProductReferencesToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :draft?,  :boolean, default: true
    add_reference :quotes, :product, index: true

    remove_reference :products, :quote
  end
end
