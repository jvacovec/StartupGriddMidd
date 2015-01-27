class TagsController < ApplicationController

  def topics
    render_tree = params[:tree] == "false" ? false : true
    @tags = Tag.where(:custom => false).order(:name)
    @topics = @tags.select { |m| m.parent_id.nil? }
    if render_tree
      @topics.map! { |topic|
        json = topic.as_json
        json["children"] = @tags.select { |st|
          st.parent_id == topic.id
        }.map { |st| 
          tag_json = st.as_json
          tag_json["children"] = @tags.select { |tag|
            tag.parent_id == st.id
          }.map { |tag|
            tag.as_json
          }
          tag_json
        }
        json
      }
    end
    render json: @topics
  end

  def posts
    post_ids = Tagging.where(:tag_id => params[:id]).where.not(:post_id => nil).map {|m| m.post_id }
    @posts = Post.where(:id => post_ids)
    render json: @posts, :include => [:author, :user, :tags, {:questions => {:include => :answers}}]
  end
end
