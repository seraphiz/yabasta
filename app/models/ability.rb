class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #


    user ||= User.new(role: 0) # guest user (not logged in)
    if user.moderator?
      can :manage, :all
      can :read, :all
      can :home, Post
      can :map, Post
      can :moderator_aprove, Post
    elsif user.author?
      can :read, :all
      can :home, Post
      can :map, Post
      can :create, [Post, Comment]
      can :update, Post, user_id: user.id # can :destroy, Comment, post: {user_id: user.id}
      can :destroy, [Post, Comment], user_id: user.id
    else
      can :read, :all
      can [:home, :map, :create, :info], Post
    end


    
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
