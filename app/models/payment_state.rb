# == Schema Information
#
# Table name: payment_states
#
#  id         :integer          not null, primary key
#  name       :string
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentState < ActiveRecord::Base
end
