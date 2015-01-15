require 'elasticsearch/model'
require 'elasticsearch/rails'

class Question < ActiveRecord::Base
  has_many :answers
  has_many :posts, through: :answers, inverse_of: :question
  has_many :taggings
  has_many :tags, through: :taggings

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Question.import