class RocketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def edit?
    return true
  end

  def create?
    return true
  end

  def update?
    # true
    record.user == user
  end

  def destroy?
    # true
    record.user == user
  end
end
