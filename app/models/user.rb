require 'elasticsearch/model'
require 'elasticsearch/rails'

class User < ActiveRecord::Base
  has_many :posts, inverse_of: :user

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end