# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  descriptif       :string
#  cctp_reference   :string
#  drawing_id       :integer
#  house_module_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_state_id :integer
#
# Indexes
#
#  index_products_on_drawing_id       (drawing_id)
#  index_products_on_house_module_id  (house_module_id)
#

class Product < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :product_state
  has_many :quotes
  has_many :modules_products
  has_many :house_modules, through: :modules_products

  def product_price
    price = 0
    self.house_modules.each{|hm| price += hm.module_price}
    return price
  end
  
  def product_price_w_vat
    price = 0
    self.house_modules.each{|hm| price += hm.module_price_w_vat}
    return price
  end
end
