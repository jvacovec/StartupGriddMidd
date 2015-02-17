require 'elasticsearch/model'
require 'elasticsearch/rails'

class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :author, inverse_of: :posts
  has_many :answers
  has_many :questions, through: :answers
  has_many :taggings
  has_many :tags, through: :taggings

  def to_s
    title
  end
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    as_json(
      include: [:author, :tags]
    )
  end

  def self.search(query)
    __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ["title", "post.author.name", "post.tag.name^10"],
          fuzziness: "auto"
        }
      },
      filter: {
        term: { tag: query }
      }
    }
    )
  end
end