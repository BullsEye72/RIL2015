class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index], :commercial if user.has_role? :commercial
  end
end
