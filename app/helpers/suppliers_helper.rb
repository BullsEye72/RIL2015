module SuppliersHelper
  def count_article_in_supplier supp_id
    Supplier.find(supp_id).articles.count
  end
end
