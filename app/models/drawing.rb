# == Schema Information
#
# Table name: drawings
#
#  id                 :integer          not null, primary key
#  thumbnail_path     :string
#  file_path          :string
#  drawing_type       :integer
#  internal_reference :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Drawing < ActiveRecord::Base
    
    
    
    def to_label
        "#{file_path}"
    end
    
end
