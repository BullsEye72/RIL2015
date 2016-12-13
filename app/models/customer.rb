# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  firstname    :string
#  lastname     :string
#  address      :text
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

class Customer < ActiveRecord::Base

  default_scope { where(:deleted_at => nil) }

  has_many :projects

  validates_presence_of :firstname, :lastname, :phone_number, :address
  
  def fullname
    return "#{firstname.capitalize} #{lastname.upcase}"
  end
  
end


