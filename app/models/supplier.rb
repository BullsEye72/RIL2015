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
#

class Supplier < ActiveRecord::Base
  has_and_belongs_to_many :article_suppliers
end
