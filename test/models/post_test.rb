require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should have_db_column(:trashed_at)
  should have_db_index(:trashed_at)
  should have_db_column(:nanoid)
  should have_db_index(:nanoid)

  context 'associations' do
    should have_many(:reactions)
    should have_many(:post_hits)
    should have_many(:comments)
    should have_many(:reports)
    should belong_to(:category).counter_cache(true)
    should belong_to(:team).optional
    should belong_to(:user)
  end

  context 'validations' do
    should validate_presence_of(:title)
    should validate_length_of(:title).is_at_most(128)
  end
end
