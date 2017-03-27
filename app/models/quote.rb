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
  before_create :set_quote_on_create
  before_update :update_construction_state
  before_destroy :check_if_draft

  default_scope { where(deleted_at: nil) }
  
  belongs_to :project
  belongs_to :user
  belongs_to :product
  has_and_belongs_to_many :construction_states
  has_and_belongs_to_many :quote_states

  # validates_presence_of :user
  #validates :project_id, presence: true, uniqueness: {scope: :user_id}
  
  def to_label
    "Devis n°#{id}"
  end
  
  def last_updated_at
      times = []
      times << self.updated_at
      times << self.quote_states.last.updated_at unless self.quote_states.last.nil?
      times << self.construction_states.last.updated_at unless self.construction_states.last.nil?
      
      return times.max
  end

  private

    def set_quote_on_create
      if User.current.nil?
        self.user = User.find_by(email: "commercial@madera.com") unless self.user.nil?
      else
        self.user = User.current
      end
      self.quote_states<< QuoteState.find_by_name(:brouillon)
    end

    def update_construction_state
      if quote_states.last == QuoteState.find_by_name('accepté')
        construction_states<<ConstructionState.find_by_name('Devis signé')
      end
    end

    def check_if_draft
      return true if self.quote_states.last != QuoteState.find_by_name(:brouillon)
      errors.add(:quote_states, 'Seul les devis à l\'état de brouillon sont effacable')
      false
    end

end