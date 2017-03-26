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

  @@invalid_product_state = ProductState.find_by_name('invalide')
  @@default_product_state = ProductState.find_by_name('defaut')
  @@normal_product_state = ProductState.find_by_name('normal')
  @@draft_product_state = ProductState.find_by_name('brouillon')

  before_create :set_product_on_create

  belongs_to :drawing
  belongs_to :product_state
  has_many :quotes
  has_many :modules_products
  has_many :house_modules, through: :modules_products

  scope :default, -> { where(product_state: @default_product_state)}
  scope :draft, -> { where(product_state: @draft_product_state)}
  scope :draft_or_default, -> {
    where(product_state: [
        ProductState.find_by_name('brouillon'),
        ProductState.find_by_name('defaut'),
    ])
  }

  validate :only_draft_can_be_invalidate
  validate :normal_and_default_can_t_be_draft

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

  private

  def only_draft_can_be_invalidate
    if (product_state == @@invalid_product_state ) and (product_state_id_was != @@draft_product_state.id)
      errors.add(:product_state, 'Seul les brouillons peuvent être invalidé')
    end
  end

  def normal_and_default_can_t_be_draft
    if (product_state == @@draft_product_state) and (product_state_id_was.in? [@@normal_product_state.id, @@default_product_state.id])
      errors.add(:product_state, 'Les produits normaux ou par défaut ne peuvent devenir des brouillons')
    end
  end

end
