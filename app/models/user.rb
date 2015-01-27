require 'elasticsearch/model'
require 'elasticsearch/rails'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :posts, inverse_of: :user
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  protected
  
  def confirmation_required?
    false
  end  
end