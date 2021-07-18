require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:follower)
    should belong_to(:followable)
  end
end
