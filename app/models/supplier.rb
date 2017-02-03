# == Schema Information
#
# Table name: suppliers
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  siret        :string
#  fax_number   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

class Supplier < ActiveRecord::Base
  has_many :articles_suppliers
  has_many :articles, through: :articles_suppliers
end
