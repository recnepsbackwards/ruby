class Tasklist
  def initialize
    @list = []
    @completed_tasks = []
    @incompleted_tasks = []
    @due_dates = []
    @tasks_only = []

  end

  def list
    @list
  end

  def add_task task
    @list << task
  end

  def completed_tasks
    @completed_tasks
  end

  def show_complete
    @completed_tasks = @list.select { |task| task.done == true }
  end

  def show_incomplete
    @incompleted_tasks = @list.select { |task| task.done == false }
  end

  def due_dates
    @due_dates
  end

  def show_due_dates
    @due_dates = @list.select { |task| task.class == ToDoItem }
  end

  def show_tasks_only
    @tasks_only = @list.select { |task| task.class == Task }
  end

  def incompleted_due_dates
    @list.select { |task| task.class == ToDoItem && task.done == false }.sort_by {|task| task.add_date}
  end

  def incompleted_today
    @list.select { |task| task.class == ToDoItem && task.done == false && task.add_date == 'Date: ' + Date.today.to_s }
  end
end
