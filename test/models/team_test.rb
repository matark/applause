require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
    should have_many(:posts)
    should have_many(:members).class_name('TeamUser')
    should have_many(:pending_members).class_name('TeamUser')
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:slug)
    should validate_length_of(:name).is_at_most(32)
    should validate_length_of(:slug).is_at_most(32)
    should validate_uniqueness_of(:slug)
  end
end
