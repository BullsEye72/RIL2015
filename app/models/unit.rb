# == Schema Information
#
# Table name: units
#
#  id               :integer          not null, primary key
#  name             :string
#  regex            :string
#  unit_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deleted_at       :datetime
#
# Indexes
#
#  index_units_on_unit_category_id  (unit_category_id)
#

class Unit < ActiveRecord::Base
  default_scope { where(:deleted_at => nil) }
    
  belongs_to :unit_category
end
