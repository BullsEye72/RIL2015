class AddMissingSoftDeletes < ActiveRecord::Migration
  def change
    add_column :articles, :deleted_at, :datetime
    add_column :orders, :deleted_at, :datetime
    add_column :suppliers, :deleted_at, :datetime
    add_column :units, :deleted_at, :datetime
  end
end
