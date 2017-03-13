# == Schema Information
#
# Table name: article_groups
#
#  id               :integer          not null, primary key
#  name             :string
#  article_group_id :integer
#  description      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_article_groups_on_article_group_id  (article_group_id)
#

class ArticleGroup < ActiveRecord::Base

  belongs_to :article_group

  validates_presence_of :name

end
