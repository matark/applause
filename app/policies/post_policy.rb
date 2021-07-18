class PostPolicy < ApplicationPolicy
  def show?
    record.published? or manage?
  end

  def update?
    manage?
  end

  def destroy?
    manage?
  end

  def manage?
    owner?
  end
end
