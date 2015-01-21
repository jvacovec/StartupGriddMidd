require 'elasticsearch/model'
require 'elasticsearch/rails'

class Tag < ActiveRecord::Base
  belongs_to :parent, class_name: 'Tag', foreign_key: 'parent_id'
  has_many :children, -> { order(:name) }, class_name: 'Tag', foreign_key: 'parent_id'

  has_many :taggings
  has_many :posts, through: :taggings
  has_many :posts, through: :children, through: :taggings

  def to_s
    name
  end

  def as_json(options={})
    super(options)
  end

  def to_tree
    json_rep = as_json :include => { 
      :children => {
        :methods => [:post_count],
        :include => { 
          :children => {
            :methods => [:post_count]
          } 
        }
      }
    }, :methods => [:post_count]
  end

  def post_count
    posts.count
  end
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Tag.import
