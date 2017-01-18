# == Schema Information
#
# Table name: articles_caracteristics
#
#  id                :integer          not null, primary key
#  article_id        :integer
#  characteristic_id :integer
#  value             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_articles_caracteristics_on_article_id         (article_id)
#  index_articles_caracteristics_on_characteristic_id  (characteristic_id)
#

class ArticlesCaracteristic < ActiveRecord::Base
  belongs_to :article
  belongs_to :characteristic
  
  validates :article_id, :presence => true, :uniqueness => {:scope => :characteristic_id}
end
