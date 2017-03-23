# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  default        :boolean
#  descriptif     :string
#  cctp_reference :string
#  drawing_id     :integer
#  modules_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_products_on_drawing_id  (drawing_id)
#  index_products_on_modules_id  (modules_id)
#

class Product < ActiveRecord::Base
  belongs_to :drawing
  has_many :quotes
  has_many :modules_products
  has_many :house_modules, through: :modules_products

  def product_price
    price = 0
    self.house_modules.each do |hm|
      price += hm.module_price
    end
    
    return price
  end
end
