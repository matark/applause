class TeamSerializer < ActiveModel::Serializer
  attribute :name
  attribute :slug
  attribute :description
  attribute :created_at
  attribute :updated_at

  belongs_to :user, key: 'creator'
end
