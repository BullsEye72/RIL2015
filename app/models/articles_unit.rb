# == Schema Information
#
# Table name: articles_units
#
#  id         :integer          not null, primary key
#  article_id :integer
#  unit_id    :integer
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_units_on_article_id  (article_id)
#  index_articles_units_on_unit_id     (unit_id)
#

class ArticlesUnit < ActiveRecord::Base
  belongs_to :article
  belongs_to :unit

  validates :article, presence: true, uniqueness: {scope: :unit}
  validates :unit, presence: true
  validates_presence_of :value
  
  def to_label
    u=unit.name
    c=unit.unit_category.name
    v=value
    return "[#{c}] #{v} #{u}"
  end
  
end
