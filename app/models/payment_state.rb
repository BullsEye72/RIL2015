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

  validates_presence_of :name, :value
  validates_uniqueness_of :name
  validates_numericality_of :value, greater_than: 0, less_than_or_equal_to: 1

  def label
    "#{self.name} : #{self.value} yolo !"
  end

end
