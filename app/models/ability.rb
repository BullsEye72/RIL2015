class Ability
  include CanCan::Ability

  def initialize(user)
    #Commerciaux
    if user.has_role? :commercial
      can :manage, Project
    end

    #Service Achats
    if user.has_role? :purchaser
      can :manage, Order
      can :manage, Article
      can :manage, Supplier
      can :show, Quote
    end
  end
end
