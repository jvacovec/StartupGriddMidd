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
    post_ids = Tagging.where(:tag_id => params[:id]).where.not(:post_id => nil).map {|m| m.post_id }
    @posts = Post.where(:id => post_ids)
    render json: @posts, :include => [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
