class SearchController < ApplicationController
	def search
	  if params[:q].nil?
	    @answers = []
	    @authors = []
	    @posts = []
	    @questions = []
	    @tags = []
	    @user = []
	  else
	    @answers = Answer.search(params[:q])
	    @authors = Author.search(params[:q])
	    @posts = Post.search(params[:q])
	    @questions = Questions.search(params[:q])
	    @tags = Tag.search(params[:q])
	    @users = User.search(params[:q])
	  end
	end
end