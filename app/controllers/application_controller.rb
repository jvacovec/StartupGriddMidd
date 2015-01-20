class ApplicationController < ActionController::API
  def oauth2callback
    code = params[:code]    
  end
end
