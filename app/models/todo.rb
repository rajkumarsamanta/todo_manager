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

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where("completed = ?", true)
  end
end
