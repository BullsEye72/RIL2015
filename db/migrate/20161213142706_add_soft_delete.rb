class AddSoftDelete < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    add_column :quotes, :deleted_at, :datetime
    add_column :projects, :deleted_at, :datetime
    add_column :customers, :deleted_at, :datetime
  end
end
