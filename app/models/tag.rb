require 'elasticsearch/model'
require 'elasticsearch/rails'

class Tag < ActiveRecord::Base
  belongs_to :parent, class_name: 'Tag', inverse_of: :tag
  has_many :children, class_name: 'Tag', inverse_of: :parent
  has_and_belongs_to_many :questions, inverse_of: :tags
  has_and_belongs_to_many :posts, inverse_of: :tags

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Tag.import