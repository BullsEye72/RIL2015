# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_quotes_on_project_id  (project_id)
#  index_quotes_on_user_id     (user_id)
#

class Quote < ActiveRecord::Base

  belongs_to :project
  belongs_to :user
  has_and_belongs_to_many :construction_states
  has_and_belongs_to_many :quote_states
  
  validates_presence_of :project, :user, :construction_states, :quote_states
  validates :project_id, presence: true, uniqueness: {scope: :user_id}
  
  def to_label
    "Devis n°#{id}"
  end
end
