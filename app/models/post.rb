require 'elasticsearch/model'
require 'elasticsearch/rails'

class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :author, inverse_of: :posts
  has_many :answers, inverse_of: :post
  has_many :questions, through: :answers, inverse_of: :post
  has_many :taggings
  has_many :tags, through: :taggings

  def to_s
    title
  end
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
