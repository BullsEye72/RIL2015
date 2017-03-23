class Ability
  include CanCan::Ability

  def initialize(user)

    #Commerciaux
    if user.has_role? :commercial
      can :index, :commercial
      can :manage, Project
      can :manage, Quote
      can :manage, Product
      can :show, [Order,Article,Supplier,HouseModule]
    end

    #Service Achats
    if user.has_role? :purchaser
      can :index, :purchase
      can :manage, Order
      can :manage, Article
      can :manage, Supplier
      can :show, [Quote,Project]
    end
    
    #BE
    if user.has_role? :conceptor
      can :index, :conception
      can :manage, Article
      can :manage, Supplier
      can :manage, HouseModule
      can :manage, Product
      can [:show], [Quote,Project]
    end

    #Compta
    if user.has_role? :compta
      can :manage, Payment
      can :show, Quote
    end

  end

end
