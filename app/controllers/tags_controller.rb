class TagsController < ApplicationController

  def topics
    render_tree = params[:tree] == "false" ? false : true 
    if render_tree
      tags_hash = Hash.new {|h,k| h[k] = []}
      tags = Tag.where(:custom => false).order(:name)
      tags.each { |t| tags_hash[t.parent_id] << t }
      topics = tags.select { |m| m.parent_id.nil? }
      @tree = topics.map do |t|
        t_json = t.to_json
        t_json["children"] = tags_hash[t.id].map do |st|
          st_json = st.to_json
          st_json["children"] = tags_hash[st.id].map do |tg|
            tg.to_json
          end
          st_json
        end
        t_json
      end
      render json: @tree
    else
      @topics = Tag.where(:custom => false, parent_id => nil).order(:name)
      render json: @topics
    end
  end

  def posts
    post_ids = Tagging.where(:tag_id => params[:id]).where.not(:post_id => nil).map {|m| m.post_id }
    @posts = Post.where(:id => post_ids)
    render json: @posts, :include => [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
