# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  total_due_calc :decimal(, )
#  supplier_id    :integer
#  quote_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_orders_on_quote_id     (quote_id)
#  index_orders_on_supplier_id  (supplier_id)
#

class Order < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :quote
  
  validates_presence_of :total_due_calc, :quote, :supplier
  
end
