# == Schema Information
#
# Table name: quote_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuoteState < ActiveRecord::Base

  has_and_belongs_to_many :quotes

  validates_presence_of :name
  validates_uniqueness_of :name

end
