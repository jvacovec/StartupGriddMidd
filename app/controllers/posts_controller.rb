class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    includes = [:author, :user, :tags]
    @posts = Post.includes(*includes)
                    .order(:date_posted)
                    .page(params[:page])
    # if stale?(@posts)
    paginate json: @posts, include: includes
    # end
  end
end
