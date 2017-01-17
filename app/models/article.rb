# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  name               :string
#  article_group_id   :integer
#  value_added_tax_id :integer
#  reference          :string
#  description        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_articles_on_article_group_id    (article_group_id)
#  index_articles_on_value_added_tax_id  (value_added_tax_id)
#

class Article < ActiveRecord::Base
  belongs_to :article_group
  belongs_to :value_added_tax
  
  has_and_belongs_to_many :articles
end
