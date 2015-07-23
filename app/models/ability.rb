class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    user.role ||= user.assign_role
    if user.admin?
      can :manage, :all
    elsif user.seller?
      can :read, Item
      can :create, Item
      can :update, Item do |item|
        item.try(:user) == user
      end
      can :destroy, Item do |item|
        item.try(:user) == user
      end
    elsif user.regular?
      can :read, Item    
    end
  end

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end