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
#  draft?     :boolean          default(TRUE)
#  product_id :integer
#
# Indexes
#
#  index_quotes_on_product_id  (product_id)
#  index_quotes_on_project_id  (project_id)
#  index_quotes_on_user_id     (user_id)
#

class Quote < ActiveRecord::Base
  before_create :set_quote

  default_scope { where(deleted_at: nil) }
  
  belongs_to :project
  belongs_to :user
  belongs_to :product
  has_and_belongs_to_many :construction_states
  has_and_belongs_to_many :quote_states

  # validates_presence_of :user
  validates :project_id, presence: true, uniqueness: {scope: :user_id}
  
  def to_label
    "Devis n°#{id}"
  end

  private

    def set_quote
      self.user = User.current
      self.quote_states<< QuoteState.find_by_name(:brouillon)
    end

end
