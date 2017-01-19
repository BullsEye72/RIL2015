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
end
