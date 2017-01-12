# == Schema Information
#
# Table name: margins
#
#  id         :integer          not null, primary key
#  name       :string
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Margin < ActiveRecord::Base

  validates :name, :value, presence: true
  validates_numericality_of :value, greater_than: 0

  has_and_belongs_to_many :quotes

end
