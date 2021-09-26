class TodosController < ApplicationController
  def index
    render plain: "Hello,  This is /todos!"
  end
end
