class ApplicationPolicy < ActionPolicy::Base
  private

  def owner?
    record.user_id.eql?(user&.id)
  end
end
