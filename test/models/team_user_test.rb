require 'test_helper'

class TeamUserTest < ActiveSupport::TestCase
  should define_enum_for(:role)
  should define_enum_for(:state)

  context 'associations' do
    should belong_to(:team)
    should belong_to(:user)
  end

  context 'delegations' do
    should delegate_method(:email).to(:user)
    should delegate_method(:avatar).to(:user)
    should delegate_method(:username).to(:user)
  end
end
