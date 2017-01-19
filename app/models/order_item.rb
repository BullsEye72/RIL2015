# == Schema Information
#
# Table name: order_items
#
#  id                   :integer          not null, primary key
#  articles_supplier_id :integer
#  order_id             :integer
#  quantity             :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_order_items_on_articles_supplier_id  (articles_supplier_id)
#  index_order_items_on_order_id              (order_id)
#

class OrderItem < ActiveRecord::Base
  belongs_to :articles_supplier
  belongs_to :order
end
