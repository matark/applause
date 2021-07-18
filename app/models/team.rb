class Team < ApplicationRecord
  with_options class_name: 'TeamUser' do |assoc|
    assoc.has_many :members, -> { includes(:user).accepted }
    assoc.has_many :pending_members, -> { includes(:user).pending }
  end

  has_many :posts
  belongs_to :user
  before_save :ensure_slug, if: -> { slug_changed? }

  validates :name, presence: true, length: { maximum: 32 }
  validates :slug, presence: true, length: { maximum: 32 }, uniqueness: true

  private

  def ensure_slug
    self.slug = slug.parameterize
  end
end
