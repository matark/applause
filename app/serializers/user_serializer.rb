class UserSerializer < ActiveModel::Serializer
  attribute :id
  attribute :username
  attribute :avatar
  attribute :name
  attribute :bio
  attribute :followers_count
  attribute :following_count
  attribute :posts_count
  attribute :created_at
  attribute :updated_at

  with_options if: -> { mine? } do |serializer|
    serializer.attribute :email
    serializer.attribute :plan
    serializer.attribute :plan_due_at
  end

  private

  def mine?
    object.id.eql?(current_user&.id)
  end
end
