class NotificationSerializer < ActiveModel::Serializer
  attribute :id
  attribute :unread
  attribute :payload
  attribute :created_at
  attribute :updated_at

  belongs_to :actor
  belongs_to :user
end
