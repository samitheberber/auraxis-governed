class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      declare_mission(user)
    end
  end

  def declare_mission(user)
    can :read, Mission
    can :create, Mission
    can :manage, Trooper, mission: { id: user.mission_ids }
    can [:edit, :destroy], Mission, user: user
  end
end
