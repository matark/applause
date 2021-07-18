class Comment < ApplicationRecord
  include Likeable
  include Reportable

  with_options class_name: 'Comment' do |assoc|
    assoc.has_many :children, foreign_key: 'parent_id', :dependent => :delete_all
    assoc.belongs_to :parent, optional: true
  end

  belongs_to :post
  belongs_to :user

  def mentions
    content.to_s.gsub(/[\A\s]?@[^@\s]+/).map(&:strip)
  end
end
