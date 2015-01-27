class ApplicationController < ActionController::API
  def oauth2callback
    code = params[:code]    
  end

  def ping
    render plain: "StartupGrid API is up! Try these endpoints:\n\n/posts\n/posts/:id\n/authors\n/authors/:id\n/tags\n/tags/:id\n/topics"
  end
end
