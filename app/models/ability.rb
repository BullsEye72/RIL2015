class Ability
  include CanCan::Ability

  def initialize(user)

    #Commerciaux
    if user.has_role? :commercial
      can :index, :commercial
      can :manage, Project
      can :manage, Quote
      can :show, [Order,Article,Supplier]
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
      can [:show], [Quote,Project]
    end

  end

end
