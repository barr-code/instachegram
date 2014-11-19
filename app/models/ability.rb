class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    else
      can :read, :all
      can :create, Photo
      can [:update, :destroy], Photo, :user_id => user.id
      can :create, Comment
    end
  end
end
