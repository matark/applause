class UserPolicy < ApplicationPolicy
  def show?
    manage? or owner?
  end

  def update?
    manage? or owner?
  end

  def manage?
  end
end
