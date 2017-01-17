module SuppliersHelper
  def count_article_in_supplier supp_id
    ArticleSupplier.joins(:supplier, :article).where(supplier_id: supp_id).count
  end
end
