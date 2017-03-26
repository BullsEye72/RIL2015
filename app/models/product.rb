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
  before_create :set_product_on_create

  belongs_to :drawing
  belongs_to :product_state
  has_many :quotes
  has_many :modules_products
  has_many :house_modules, through: :modules_products

  scope :default, -> { where(product_state: ProductState.find_by_name('defaut'))}
  scope :draft, -> { where(product_state: ProductState.find_by_name('brouillon'))}
  scope :draft_or_default, -> {
    where(product_state: [
        ProductState.find_by_name('brouillon'),
        ProductState.find_by_name('defaut'),
    ])
  }

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

  def set_product_on_create
    self.product_state ||= ProductState.find_by_name('brouillon')
  end

end
