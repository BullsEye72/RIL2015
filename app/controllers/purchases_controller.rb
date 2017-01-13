class PurchasesController < ApplicationController
  
  def index
    
    @suppliers = Supplier.all
    
    
    case params[:cat]
    when 'suppliers'
      @interfaceTitle = 'Fournisseurs'
      when 'quotes'
      @interfaceTitle = 'Devis'
      when 'orders'
      @interfaceTitle = 'Commandes'
      when 'articles'
      @interfaceTitle = 'Articles'
    else
      @interfaceTitle = 'Accueil'
    end
  end
  
end
