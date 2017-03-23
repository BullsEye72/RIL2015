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
#  quote_id       :integer
#  modules_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_products_on_drawing_id  (drawing_id)
#  index_products_on_modules_id  (modules_id)
#  index_products_on_quote_id    (quote_id)
#

class Product < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :quote
  
  
  has_many :modules_products
  has_many :modules, through: :modules_products
end
