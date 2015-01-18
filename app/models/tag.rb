class Tag < ActiveRecord::Base
  belongs_to :parent, class_name: 'Tag', foreign_key: 'parent_id'
  has_many :children, class_name: 'Tag', foreign_key: 'parent_id'

  has_and_belongs_to_many :questions, inverse_of: :tags
  has_and_belongs_to_many :posts, inverse_of: :tags
end
