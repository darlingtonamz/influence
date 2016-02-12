class HomeController < ApplicationController
  layout "home"

  def index
    redirect_to "http://localhost:9000"
  end
end
