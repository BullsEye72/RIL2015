# == Schema Information
#
# Table name: articles_modules
#
#  id               :integer          not null, primary key
#  house_module_id  :integer
#  article_id       :integer
#  drawing_position :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_articles_modules_on_article_id       (article_id)
#  index_articles_modules_on_house_module_id  (house_module_id)
#

class ArticlesModule < ActiveRecord::Base
  belongs_to :house_module
  belongs_to :article
  
  def to_label
    article.name  
  end
end
