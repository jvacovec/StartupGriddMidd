class ApplicationController < ActionController::API
  def oauth2callback
    code = params[:code]    
  end

  def ping
    render plain: "StartupGrid API is up! Try these endpoints:\n/posts\n/tags/:id/posts\n/topics"
  end
end
