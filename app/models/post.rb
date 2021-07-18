class Post < ApplicationRecord
  include Discard::Model
  include Nanoid::Model
  include Reportable

  default_scope { kept.published }
  scope :recent, -> { order(id: 'desc') }
  scope :published, -> { where.not(published_at: nil) }
  scope :not_published, -> { where(published_at: nil) }
  scope :search, -> (title) { where('title LIKE ?', %|%#{title}%|) }

  with_options dependent: :delete_all do |assoc|
    assoc.has_many :reactions
    assoc.has_many :post_hits
  end

  has_many :comments
  belongs_to :category, counter_cache: true
  belongs_to :team, optional: true
  belongs_to :user

  validates :title, presence: true, length: { maximum: 128 }

  def published?
    published_at.present?
  end

  self.discard_column = :trashed_at
end
