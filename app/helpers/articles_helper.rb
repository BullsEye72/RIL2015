module ArticlesHelper
  def show_or_count_supplier_in_article art_id
    a = Article.find(art_id).suppliers
    c = a.count
    
    if c > 1 then
      return "#{a.first.name} [+#{c-1}...]"
    elsif c = 1
      return a.first.name
    else
      return 'Aucun fournisseur'
    end
    
  end
end
