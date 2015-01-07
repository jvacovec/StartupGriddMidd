class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :author, inverse_of: :posts
  has_many :answers, inverse_of: :posts
  has_and_belongs_to_many :tags, inverse_of: :posts
end