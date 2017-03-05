class AddEffectiveToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :effective?, :boolean, default: false
  end
end
