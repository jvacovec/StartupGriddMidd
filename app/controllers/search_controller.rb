class SearchController < ApplicationController
  def search
    if not params[:q].nil?
      posts = Post.search(params[:q]).map{ |p| p["_source"]}
    else 
       posts = []
    end
    render json: posts
  end
end