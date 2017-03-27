class AddPriceToHouseModules < ActiveRecord::Migration
  def change
    add_column :house_modules, :lowest_price, :decimal
    add_column :house_modules, :lowest_price_w_vat, :decimal
  end
end
