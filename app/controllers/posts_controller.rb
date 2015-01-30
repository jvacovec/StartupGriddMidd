class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if stale?(@posts)
      paginate json: @posts, per_page: 20, include: [:author, :user, :tags, {:questions => {:include => :answers}}]
    end
  end
end
