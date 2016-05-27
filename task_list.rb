class Tasklist

  def initialize
    @list = []
    @completed_tasks = []
    @incompleted_tasks = []

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



end
