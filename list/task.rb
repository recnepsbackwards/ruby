class Task
  def initialize
    @title = 'title'
    @description = 'description'
    @done = false
  end

  def title
    @title
  end

  def title= title
    @title = 'Title: ' + title.to_s
  end

  def description
    @description
  end

  def description= description
    @description = 'Description: ' + description.to_s
  end

  def details
    @details = @title + "\n" +
    @description + "\n" +
    'Status: ' + done_status
  end

  def done
    @done
  end

  def change_task_to_completed
    @done = true
  end

  def done_status
    if @done == true
      'This task is done.'
    else
      'This task is not done.'
    end
  end
end
