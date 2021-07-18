require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:likes)
    should have_many(:reports)
    should have_many(:children).class_name('Comment').with_foreign_key('parent_id').dependent(:delete_all)
    should belong_to(:parent).class_name('Comment').optional
    should belong_to(:post)
    should belong_to(:user)
  end
end
