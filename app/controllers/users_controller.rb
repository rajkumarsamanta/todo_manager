class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  # def index
  #   render plain: User.all.to_displayable_list.join("\n")
  # end

  # def show
  #   id = params[:id]
  #   user_id = User.find(id)
  #   render plain: user_id.to_displayable_string
  # end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    #password = params[:password]
    new_user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      # password: password,
    )
    # response_text = "Hey, your new user is created with id #{new_user.id}"
    # render plain: response_text
    redirect_to "/"
  end

  # def update
  #   id = params[:id]
  #   email = params[:email]
  #   password = params[:password]
  #   user = User.find(id)
  #   user.email = email
  #   user.password = password
  #   user.save!
  #   render plain: "Updated user email and password !"
  # end

  # def login
  #   user_email = params[:email]
  #   passwd = params[:password]
  #   user = User.find_by(email: user_email, password: passwd)
  #   render plain: "User login status : #{user.presence?}"
  # end
end
