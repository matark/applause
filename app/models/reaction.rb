class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :kind, inclusion: { in: 0..5 }
end
