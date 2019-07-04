class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= Admin.new
    if admin.admin?
      can :manage, :all
    elsif admin.contributor?
      can :manage, Blog
    end
  end
end
