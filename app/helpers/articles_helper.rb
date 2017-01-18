module ArticlesHelper
  def show_or_count_supplier_in_article art_id
    a = Article.find(art_id).suppliers
    ac = Article.find(art_id).articles_suppliers.order(price: :asc)
    c = a.count
    
    if c > 1 then
      minpriced = a.find_by(id: ac.first.supplier_id)
      
      return "#{minpriced.name} [+#{c-1}...]"
    elsif c == 1
      return a.first.name
    else
      return 'Aucun fournisseur'
    end
    
  end
end
