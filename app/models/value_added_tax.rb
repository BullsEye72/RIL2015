# == Schema Information
#
# Table name: value_added_taxes
#
#  id         :integer          not null, primary key
#  value      :decimal(, )
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ValueAddedTax < ActiveRecord::Base

  def to_label
    "#{name} | #{value}"
  end

  validates :value, :name, presence: true
  validates_numericality_of :value, greater_than: 0

end
