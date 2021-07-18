require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
    should belong_to(:likeable)
  end
end
