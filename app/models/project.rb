# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
# Indexes
#
#  index_projects_on_customer_id  (customer_id)
#

class Project < ActiveRecord::Base

  default_scope { where(:deleted_at => nil) }

  belongs_to :customer
  has_many :quotes

  validates_presence_of :customer, :description


  accepts_nested_attributes_for :customer

end
