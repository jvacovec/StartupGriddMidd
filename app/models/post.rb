require 'elasticsearch/model'
require 'elasticsearch/rails'

class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :author, inverse_of: :posts
  has_many :answers, inverse_of: :posts
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.join(", ")
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Post.import