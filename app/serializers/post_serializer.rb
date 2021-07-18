class PostSerializer < ActiveModel::Serializer
  attribute :nanoid, key: 'id'
  attribute :title
  attribute :body
  attribute :archived
  attribute :published_at
  attribute :trashed_at
  attribute :created_at
  attribute :updated_at

  belongs_to :category
  belongs_to :user
end
