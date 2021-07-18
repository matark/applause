require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_db_index(:email)
  should have_db_index(:username)
  should have_db_index(:refresh_token)
  should have_db_column(:trashed_at)
  should have_db_index(:trashed_at)
  should define_enum_for(:role)
  should define_enum_for(:plan)
  should have_secure_password

  context 'associations' do
    should have_many(:teams)
    should have_many(:team_users)
    should have_many(:related_teams).source(:team).through(:team_users)
    should have_many(:posts)
    should have_many(:comments)
    should have_many(:notifications)
  end

  context 'validations' do
    should validate_presence_of(:email)
    should validate_presence_of(:username)
    should validate_uniqueness_of(:email).ignoring_case_sensitivity
    should validate_uniqueness_of(:username).case_insensitive
    should validate_length_of(:username).is_at_least(3).is_at_most(32)
    should validate_length_of(:name).is_at_least(3).is_at_most(32).allow_blank
  end
end
