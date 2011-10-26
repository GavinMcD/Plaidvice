class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # <= this is a guest user (not logged in)
    
    can :read, :all
    can :audience, Nugget
    
    can [:update, :destroy], User do |currentuser|
      currentuser && currentuser.id == user.id
    end
    
    can :create, Nugget
    can [:update, :destroy], Nugget do |nugget|
      nugget && nugget.user.id == user.id
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
