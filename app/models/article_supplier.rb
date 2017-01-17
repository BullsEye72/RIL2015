# == Schema Information
#
# Table name: article_suppliers
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
#  index_article_suppliers_on_article_id   (article_id)
#  index_article_suppliers_on_supplier_id  (supplier_id)
#

class ArticleSupplier < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :article
end
