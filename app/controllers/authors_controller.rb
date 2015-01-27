class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    paginate json: @authors, per_page: 20
  end
end