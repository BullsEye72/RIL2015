# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  name               :string
#  article_group_id   :integer
#  value_added_tax_id :integer
#  reference          :string
#  description        :text
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
  
  has_many :articles_caracteristic
  has_many :articles_suppliers
  has_many :suppliers, through: :articles_suppliers
  
  accepts_nested_attributes_for :articles_suppliers
end
