# == Schema Information
#
# Table name: caracteristics
#
#  id         :integer          not null, primary key
#  name       :string
#  unit_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_caracteristics_on_unit_id  (unit_id)
#

class Caracteristic < ActiveRecord::Base
  belongs_to :unit
end
