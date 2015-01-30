class PostsController < ApplicationController
  after_filter only: [:index] { set_pagination_header(:posts) }

  # GET /posts
  # GET /posts.json
  def index
    includes = [:author, :user, :tags]
    @posts = Post.includes(*includes)
                    .order(:date_posted)
                    .page(params[:page])
    if stale?(@posts)
      render json: @posts, include: includes
    end
  end
end
