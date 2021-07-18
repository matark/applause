require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:post)
    should belong_to(:user)
  end

  context 'validations' do
    should validate_inclusion_of(:kind).in_range(0..5)
  end
end
