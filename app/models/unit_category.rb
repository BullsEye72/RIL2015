# == Schema Information
#
# Table name: unit_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnitCategory < ActiveRecord::Base
end
