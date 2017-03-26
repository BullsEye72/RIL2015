# == Schema Information
#
# Table name: product_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductState < ActiveRecord::Base
  has_many :products
end
