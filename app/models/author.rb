class Author < ActiveRecord::Base
  has_many :posts, inverse_of: :author
end
