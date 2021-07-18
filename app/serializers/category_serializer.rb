class CategorySerializer < ActiveModel::Serializer
  attribute :name
  attribute :slug
  attribute :description
  attribute :created_at
  attribute :updated_at
end
