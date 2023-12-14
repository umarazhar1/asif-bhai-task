# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.manager?
      can :create, Project if user.manager?
      cannot :create, Project if user.developer? || user.qa?
    end
  end

end
