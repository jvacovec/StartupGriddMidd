class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    headers['Access-Control-Allow-Headers'] = 'Link'
    puts headers['Access-Control-Allow-Headers']
    includes = [:author, :user, :tags]
    @posts = Post.includes(*includes)
                    .order(:date_posted)
                    .page(params[:page])
    # if stale?(@posts)
    paginate json: @posts, include: includes
    # end
  end
end
