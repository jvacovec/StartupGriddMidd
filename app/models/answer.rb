require 'elasticsearch/model'
require 'elasticsearch/rails'

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :post

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end