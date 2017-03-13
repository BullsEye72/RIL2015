# == Schema Information
#
# Table name: drawing_types
#
#  id              :integer          not null, primary key
#  name            :string
#  drawing_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_drawing_types_on_drawing_type_id  (drawing_type_id)
#

class DrawingType < ActiveRecord::Base
  belongs_to :drawing_type
end
