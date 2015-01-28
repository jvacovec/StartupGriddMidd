class TagsController < ApplicationController

  def topics
    expires_in 10.minute, :public => true

    render_tree = params[:tree] == "false" ? false : true 
    if render_tree
      tags_hash = Hash.new {|h,k| h[k] = []}
      tags = Tag.where(:custom => false).order(:name)
      tags.each { |t| tags_hash[t.parent_id] << t }
      topics = tags.select { |m| m.parent_id.nil? }
      @tree = topics.map do |t|
        t_json = t.as_json
        t_json["children"] = tags_hash[t.id].map do |st|
          st_json = st.as_json
          st_json["children"] = tags_hash[st.id].map do |tg|
            tg.as_json
          end
          st_json
        end
        t_json
      end
      if stale?(@tree)
        render json: @tree
      end
    else
      @topics = Tag.where(custom: false, parent: nil).order(:name)
      if stale?(@topics)
        render json: @topics
      end
    end
  end

  def posts
    expires_in 10.minute, :public => true

    @posts = Tag.find(params[:id]).posts
    paginate json: @posts, per_page: 20, include: [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
