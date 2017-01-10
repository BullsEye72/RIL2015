# == Schema Information
#
# Table name: payment_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentState < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  def label
    "#{self.name} : #{self.value}"
  end

end
