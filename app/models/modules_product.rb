# == Schema Information
#
# Table name: modules_products
#
#  id              :integer          not null, primary key
#  house_module_id :integer
#  product_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_modules_products_on_house_module_id  (house_module_id)
#  index_modules_products_on_product_id       (product_id)
#

class ModulesProduct < ActiveRecord::Base
  belongs_to :house_module
  belongs_to :product
end
