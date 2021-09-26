class TodosController < ApplicationController
  def index
    render plain: Todo.all.to_a #"Hello,  This is /todos!"
  end
end
