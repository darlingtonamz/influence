class UsersController < ApplicationController
  def index

  end

  def show
    
    if !current_user
      redirect_to '/'
    elsif (current_user.role == 'brand')
      redirect_to '/brands'
    else
      redirect_to '/ambassadors'
    end
  end
end
