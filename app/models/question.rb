#require 'elasticsearch/model'
#require 'elasticsearch/rails'

class Question < ActiveRecord::Base
  has_many :answers
  has_many :posts, through: :answers

  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
end
#Question.import