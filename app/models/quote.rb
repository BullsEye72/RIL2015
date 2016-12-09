# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_quotes_on_project_id  (project_id)
#  index_quotes_on_user_id     (user_id)
#

class Quote < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
end
