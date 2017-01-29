class ApplicationController < ActionController::Base
  # serve as app
  #protect_from_forgery with: :exception

  #serve as api
  protect_from_forgery with: :null_session
end
