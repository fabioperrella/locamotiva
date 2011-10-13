# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # We operate with three role levels:
    #  - Editor
    #  - Moderator
    #  - Manager

    # An editor can to the following:
    #can :read, SomeOtherModel

    # A moderator can to the following:
    if user.role?('admin')
      can :manage, :all
      cannot :create, User
    end

    # A manager can to the following:
    if user.role?('user')
      can :read, :all
    end
  end
end