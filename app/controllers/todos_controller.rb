class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.all.to_displayable_list.join("\n") #"Hello,  This is /todos!"
  end

  def show
    id = params[:id]
    todo_id = Todo.find(id)
    render plain: todo_id.to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = Date.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "Hey, your new todo is created with id #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed status with #{completed}"
  end
end
