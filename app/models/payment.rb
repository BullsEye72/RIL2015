# == Schema Information
#
# Table name: payments
#
#  id               :integer          not null, primary key
#  quote_id         :integer
#  payment          :decimal(, )
#  payment_date     :decimal(, )
#  payment_state_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_payments_on_payment_state_id  (payment_state_id)
#  index_payments_on_quote_id          (quote_id)
#

class Payment < ActiveRecord::Base
  belongs_to :quote
  belongs_to :payment_state
end
