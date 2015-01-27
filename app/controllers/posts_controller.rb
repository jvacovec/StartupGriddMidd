class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    if params[:tag_id]
      @posts = Tag.find(params[:tag_id]).posts
    elsif params[:author_id]
      @posts = Author.find(params[:author_id]).posts
    else
      @posts = Post.all
    end
    paginate json: @posts, per_page: 20, include: [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
