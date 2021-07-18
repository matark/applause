class CommentSerializer < ActiveModel::Serializer
  attribute :id
  attribute :content
  attribute :likes_count
  attribute :created_at
  attribute :updated_at

  belongs_to :parent
  belongs_to :post
  belongs_to :user
end
