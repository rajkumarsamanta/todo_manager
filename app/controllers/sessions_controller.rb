class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "#{user.first_name}! you have entered correct password"
    else
      render plain: "Incorrect password !"
    end
  end
end
