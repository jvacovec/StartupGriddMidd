class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    expires_in 10.minute, :public => true
    
    @posts = Post.all
    if stale?(@posts)
      paginate json: @posts, per_page: 20, include: [:author, :user, :tags, {:questions => {:include => :answers}}]
    end
  end
end
