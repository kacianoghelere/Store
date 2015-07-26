class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    # user ||= User.new 
    # user.role ||= user.assign_role
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :read, Item
      can :create, Item
      can :update, Item do |item|
        item.try(:user) == user
      end
      can :destroy, Item do |item|
        item.try(:user) == user
      end
      can :read, User do |other|
        other == user
      end
      can :edit, User do |other|
        other == user
      end
      can :update, User do |other|
        other == user
      end
    elsif user.regular?
      can :read, Item    
      can :read, User, :id => user.id

    end
  end

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end