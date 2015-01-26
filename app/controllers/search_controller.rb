class SearchController < ApplicationController
  def search
    if not params[:q].nil?
      @posts = Post.search(params[:q]).map {|p| Post.find(p['_source']['id'])}
     else 
      @posts = []
    end
    render json: @posts, include: [:author]
  end
end