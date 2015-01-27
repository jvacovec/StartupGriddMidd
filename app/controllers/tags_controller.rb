class TagsController < ApplicationController

  def topics
    render_tree = params[:tree] == "false" ? false : true
    @topics = Tag.where(:parent_id => nil, :custom => false).order(:name)
    if render_tree
      render json: @topics.map { |t| t.to_tree }
    else
      render json: @topics
    end
  end

  def posts
    @posts = Tag.find(params[:id]).posts
    render json: @posts, :joins => [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
