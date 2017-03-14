# == Schema Information
#
# Table name: module_ranges
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ModuleRange < ActiveRecord::Base
    
    def to_label
        "#{name}"
    end
end
