class TodosController < ApplicationController
  #skip_before_action :ensure_user_logged_in

  def index
    @todos = Todo.where(user_id: current_user.id)
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = Date.parse(params[:due_date])
    Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
