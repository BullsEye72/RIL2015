# == Schema Information
#
# Table name: articles_suppliers
#
#  id                 :integer          not null, primary key
#  supplier_id        :integer
#  article_id         :integer
#  supplier_reference :string
#  price              :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_articles_suppliers_on_article_id   (article_id)
#  index_articles_suppliers_on_supplier_id  (supplier_id)
#

class ArticlesSupplier < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :article
  has_many :order_items
  
  validates_associated :order_items
  validates :supplier_id, :presence => true, :uniqueness => {:scope => :article_id}
end