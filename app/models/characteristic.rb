# == Schema Information
#
# Table name: characteristics
#
#  id         :integer          not null, primary key
#  name       :string
#  unit_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_characteristics_on_unit_id  (unit_id)
#

class Characteristic < ActiveRecord::Base
  belongs_to :unit
end
