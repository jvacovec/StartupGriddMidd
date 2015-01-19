require 'elasticsearch/model'
require 'elasticsearch/rails'

class Author < ActiveRecord::Base
  has_many :posts, inverse_of: :author

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end