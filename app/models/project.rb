# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  project_date :datetime
#  description  :string
#  customer_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_projects_on_customer_id  (customer_id)
#

class Project < ActiveRecord::Base

  belongs_to :customer
  has_many :quotes

end
