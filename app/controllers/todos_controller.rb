class TodosController < ApplicationController
  def index
    render plain: Todo.all.to_displayable_list #"Hello,  This is /todos!"
  end

  def show
    id = params[:id]
    todo_id = Todo.find(id)
    render plain: todo_id.to_displayable_string
  end
end
