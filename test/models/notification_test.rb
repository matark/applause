require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
    should belong_to(:actor).class_name('User')
    should belong_to(:notifiable)
  end
end
