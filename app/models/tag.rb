#require 'elasticsearch/model'
#require 'elasticsearch/rails'

class Tag < ActiveRecord::Base
  belongs_to :parent, class_name: 'Tag', foreign_key: 'parent_id'
  has_many :children, class_name: 'Tag', foreign_key: 'parent_id'

  has_many :taggings
  has_many :posts, through: :taggings
  has_many :posts, through: :children, through: :taggings

  def to_s
    name
  end

  def to_tree
    as_json include: :children
  end
  
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
end
#Tag.import