require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:posts)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:slug)
    should validate_length_of(:name).is_at_most(32)
    should validate_length_of(:slug).is_at_most(32)
    should validate_uniqueness_of(:slug)
  end
end
