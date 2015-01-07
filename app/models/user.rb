class User < ActiveRecord::Base
  has_many :posts, inverse_of: :user
end
