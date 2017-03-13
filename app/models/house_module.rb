# == Schema Information
#
# Table name: house_modules
#
#  id         :integer          not null, primary key
#  range_id   :integer
#  name       :string
#  default    :boolean
#  layout_id  :integer
#  drawing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_house_modules_on_drawing_id  (drawing_id)
#  index_house_modules_on_layout_id   (layout_id)
#  index_house_modules_on_range_id    (range_id)
#

class HouseModule < ActiveRecord::Base
  belongs_to :range
  belongs_to :layout
  belongs_to :drawing
end
