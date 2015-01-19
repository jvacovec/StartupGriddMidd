require 'elasticsearch/model'
require 'elasticsearch/rails'

class Tag < ActiveRecord::Base
  belongs_to :parent, class_name: 'Tag', inverse_of: :tag
  has_many :children, class_name: 'Tag', inverse_of: :parent
  has_many :taggings
  has_many :posts, through: :taggings

  def to_s
    name
  end
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end