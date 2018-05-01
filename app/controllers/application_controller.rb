class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home_page
    render html: "hello"
  end
end
