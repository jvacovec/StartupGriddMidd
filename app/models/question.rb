require 'elasticsearch/model'
require 'elasticsearch/rails'

class Question < ActiveRecord::Base
  has_many :answers
  has_many :posts, through: :answers, inverse_of: :question
  has_and_belongs_to_many :tags, inverse_of: :questions

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Question.import