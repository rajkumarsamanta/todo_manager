class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def overdue?
    due_date < Date.today
  end

  def due_later?
    due_date > Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "\nMy Todo-list \n\n"
    puts "Overdue\n"
    displayable_list = Todo.where("due_date < ?", Date.today).map { |todo| todo.to_displayable_string }
    puts displayable_list

    puts "\nDue Today\n"
    displayable_list = Todo.where("due_date = ?", Date.today).map { |todo| todo.to_displayable_string }
    puts displayable_list

    puts "\nDue Later\n"
    displayable_list = Todo.where("due_date > ?", Date.today).map { |todo| todo.to_displayable_string }
    puts displayable_list
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false).id
  end

  def self.mark_as_complete(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = !todo.completed
    todo.save
    Todo.find(todo_id)
  end
end
