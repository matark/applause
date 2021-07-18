require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
    should belong_to(:reportable)
  end
end
