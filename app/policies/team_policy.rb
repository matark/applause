class TeamPolicy < ApplicationPolicy
  def show?
    record.member_ids.include?(user.id)
  end

  def update?
    manage?
  end

  def destroy?
    manage? and record.member_ids.blank?
  end

  def manage?
    owner?
  end
end
