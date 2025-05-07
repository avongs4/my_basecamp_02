class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :set_admin, User if user.admin? # allow only admins to promote
    end
  end
end
