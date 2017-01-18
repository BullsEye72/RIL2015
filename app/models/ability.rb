class Ability
  include CanCan::Ability

  def initialize(user)
    #Commerciaux
    can [:index], :commercial if user.has_role? :commercial
    can [:new, :create, :index, :show], :project if user.has_role? :commercial
    
    #Service Achats
    can [:index], :purchases if user.has_role? :purchaser
    can [:new, :create, :index, :show], :articles if user.has_role? :purchaser
    can [:new, :create, :index, :show], :suppliers if user.has_role? :purchaser
    can [:index, :show], :quotes if user.has_role? :purchaser
  end
end
