class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      session[:current_user] = new_user.first_name
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
