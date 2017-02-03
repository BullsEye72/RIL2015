# == Schema Information
#
# Table name: article_units
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
#  index_article_units_on_article_id  (article_id)
#  index_article_units_on_unit_id     (unit_id)
#

class ArticleUnit < ActiveRecord::Base

  belongs_to :article
  belongs_to :unit
  
  validates :article, presence: true, uniqueness: {scope: :unit}
  validates :unit, presence: true, uniqueness: true
  validates_presence_of :value
  
  def to_label
    "[#{unit.unit_category.name}] #{value} #{unit.name}"
  end
end
