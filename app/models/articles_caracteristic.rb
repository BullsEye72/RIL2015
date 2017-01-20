# == Schema Information
#
# Table name: articles_caracteristics
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
#  index_articles_caracteristics_on_article_id  (article_id)
#  index_articles_caracteristics_on_unit_id     (unit_id)
#

class ArticlesCaracteristic < ActiveRecord::Base
  belongs_to :article
  belongs_to :unit
  
  validates :article_id, :presence => true, :uniqueness => {:scope => :unit_id}
  
  def to_label
    u=unit.name
    c=unit.unit_category.name
    v=value
    return "[#{c}] #{v} #{u}"
    #return "#{v} #{u}"
  end
end