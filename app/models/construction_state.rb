# == Schema Information
#
# Table name: construction_states
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  value       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ConstructionState < ActiveRecord::Base

  has_and_belongs_to_many :quotes

  validates :name, :value, presence: true
  validates_uniqueness_of :name
  validates_numericality_of :value, greater_than: 0
  
end
