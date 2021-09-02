# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :access, :rails_admin
        can :read, :dashboard
        can :manage, Product
        can :manage, User
      elsif user.moderator?
        can :access, :rails_admin
        can :manage, Product
        can :read, :dashboard
      else
        can :read, :all
      end
  end
end
