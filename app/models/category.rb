class Category < ApplicationRecord
  has_many :posts
  before_save :ensure_slug, if: -> { slug_changed? }

  validates :name, presence: true, length: { maximum: 32 }
  validates :slug, presence: true, length: { maximum: 32 }, uniqueness: true

  private

  def ensure_slug
    self.slug = slug.parameterize
  end
end
