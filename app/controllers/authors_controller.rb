class AuthorsController < ApplicationController

  # GET /authors
  # GET /authors.json
  def index
    @posts = Author.order(:name).page(params[:page])
    # if stale?(@posts)
    paginate json: @posts
    # end
  end
end
