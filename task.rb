class Task
  def initialize
    @title = 'title'
    @description = 'description'
    @done = false
  end

  def title
    @title
  end

  def give_title= title
    @title = 'Title: ' + title.to_s
  end

  def description
    @description
  end

  def give_description= description
    @description = 'Description: ' + description.to_s
  end

# FIXME new line escapes?
  def details
    @title + \n +
    @description + \n +
    'Status: ' + done_status
  end

  def labels
    'labels'
  end

  def values
    'values'
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
