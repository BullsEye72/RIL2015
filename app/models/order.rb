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
#  deleted_at     :datetime
#
# Indexes
#
#  index_orders_on_quote_id     (quote_id)
#  index_orders_on_supplier_id  (supplier_id)
#

class Order < ActiveRecord::Base

  default_scope { where(deleted_at: nil) }
  
  belongs_to :supplier
  belongs_to :quote
  has_many :order_items, dependent: :destroy
  
  validates_presence_of :quote, :supplier

  def items_quantity
    order_items.sum(:quantity).to_i
  end

  def total_price
    begin
      c=0
      order_items.each do |oi|
        c += oi.quantity * oi.articles_supplier.price
      end
      return c
    rescue
      return 'Erreur'
    end
  end


end
