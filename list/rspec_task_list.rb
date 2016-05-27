require 'rspec'
require_relative 'task'
require_relative 'task_list'
require_relative 'task_with_due_date'

# Story: As a developer, I can add all of my Tasks to a TaskList
  describe Tasklist do
    it 'should be a thing' do
      expect { Tasklist.new }.to_not raise_error
    end

    it 'should always be an array' do
      my_tasklist = Tasklist.new
      expect(my_tasklist.list).to be_a Array
    end

    it 'should take tasks into the list of all tasks array' do
      my_tasklist = Tasklist.new
      task_1 = Task.new
      task_2 = Task.new
      my_tasklist.add_task(task_1)
      my_tasklist.add_task(task_2)
      expect(my_tasklist.list).to include task_1
      expect(my_tasklist.list).to include task_2

    end

# Story: As a developer with a TaskList, I can show all the completed items.

    it 'should show completed tasks' do
      my_tasklist = Tasklist.new
      task_1 = Task.new
      task_1.change_task_to_completed
      task_2 = Task.new
      my_tasklist.add_task(task_1)
      my_tasklist.add_task(task_2)
      expect(my_tasklist.show_complete).to include task_1
      expect(my_tasklist.show_complete).to_not include task_2
    end

# Story: As a developer with a TaskList, I can show all the not completed items.

    it 'should show not completed tasks' do
      my_tasklist = Tasklist.new
      task_1 = Task.new
      task_1.change_task_to_completed
      task_2 = Task.new
      my_tasklist.add_task(task_1)
      my_tasklist.add_task(task_2)
      expect(my_tasklist.show_incomplete).to_not include task_1
      expect(my_tasklist.show_incomplete).to include task_2
    end

  # Story: As a developer, I can add items with due dates to my TaskList.
  # Hint: Consider keeping items with due dates separate from the other items.

    it 'should take to-do items and puts them into a due-date array' do
      my_tasklist = Tasklist.new
      a_to_do_item = ToDoItem.new
      a_to_do_item.add_date = '03-02-2002'
      a_to_do_item.title = 'Get mail'
      a_to_do_item.description = 'from John'
      a_to_do_item.change_task_to_completed
      my_tasklist.add_task(a_to_do_item)
      task_1 = Task.new
      task_1.title = 'Get groceries'
      task_1.description = 'from Joe'
      my_tasklist.add_task(task_1)
      expect(my_tasklist.list).to eq [a_to_do_item, task_1]
      expect(my_tasklist.show_due_dates).to eq [a_to_do_item]
    end

    it 'should take tasks only and put them into tasks only array' do
      my_tasklist = Tasklist.new
      a_to_do_item = ToDoItem.new
      a_to_do_item.add_date = '03-02-2002'
      a_to_do_item.title = 'Get mail'
      a_to_do_item.description = 'from John'
      a_to_do_item.change_task_to_completed
      my_tasklist.add_task(a_to_do_item)
      task_1 = Task.new
      task_1.title = 'Get groceries'
      task_1.description = 'from Joe'
      my_tasklist.add_task(task_1)
      expect(my_tasklist.list).to eq [a_to_do_item, task_1]
      expect(my_tasklist.show_tasks_only).to eq [task_1]
    end

  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
    #should be testing for the different cases of having dates, being completed, and vice versa.
    it 'should take the incomplete tasks that are due today and display them' do
      #create a to do item with a date that is not complete
      my_tasklist = Tasklist.new
      a_to_do_item = ToDoItem.new
      a_to_do_item.add_date = '03-02-2002'
      a_to_do_item.title = 'Get mail'
      a_to_do_item.description = 'from John'
      my_tasklist.add_task(a_to_do_item)
      #create a task that is complete but does not have a due date
      task_1 = Task.new
      task_1.title = 'Get groceries'
      task_1.description = 'from Joe'
      task_1.change_task_to_completed
      my_tasklist.add_task(task_1)
      expect(my_tasklist.list).to eq [a_to_do_item, task_1]
      expect(my_tasklist.show_tasks_only).to eq [task_1]
      expect(my_tasklist.show_due_dates).to eq [a_to_do_item]
      #create a second to do item that is completed and has a due date
      a_to_do_item_3 = ToDoItem.new
      a_to_do_item_3.add_date = '06-01-1998'
      a_to_do_item_3.title = 'Get mail'
      a_to_do_item_3.description = 'from John'
      a_to_do_item_3.change_task_to_completed
      my_tasklist.add_task(a_to_do_item_3)
      expect(my_tasklist.list).to eq [a_to_do_item, task_1, a_to_do_item_3]
      expect(my_tasklist.show_tasks_only).to eq [task_1]
      #create a second task that is not complete but does not have a due date
      task_2 = Task.new
      task_2.title = 'Get groceries'
      task_2.description = 'from Joe'
      my_tasklist.add_task(task_2)
      #create a task that is completed and due today
      a_to_do_item_4 = ToDoItem.new
      a_to_do_item_4.add_date = '27-05-2016'
      a_to_do_item_4.title = 'Get package'
      a_to_do_item_4.description = 'from Jane'
      a_to_do_item_4.change_task_to_completed
      my_tasklist.add_task(a_to_do_item_4)
      #create a task that is not completed and due today
      a_to_do_item_5 = ToDoItem.new
      a_to_do_item_5.add_date = '27-05-2016'
      a_to_do_item_5.title = 'Delivery package'
      a_to_do_item_5.description = 'from Jenny'
      my_tasklist.add_task(a_to_do_item_5)

      expect(my_tasklist.list).to eq [a_to_do_item, task_1, a_to_do_item_3, task_2, a_to_do_item_4, a_to_do_item_5]
      expect(my_tasklist.show_tasks_only).to eq [task_1, task_2]
      expect(my_tasklist.show_due_dates).to eq [a_to_do_item, a_to_do_item_3, a_to_do_item_4, a_to_do_item_5]
      expect(my_tasklist.incompleted_due_dates).to eq [a_to_do_item, a_to_do_item_5]
      # expect(my_tasklist.completed_today).to eq [a_to_do_item_4]
      expect(my_tasklist.incompleted_today).to eq [a_to_do_item_5]

    end

  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it 'should take the incomplete tasks and sort them in order of due date' do
    #create a to do item with a date that is not complete
    my_tasklist = Tasklist.new
    a_to_do_item = ToDoItem.new
    a_to_do_item.add_date = '03-02-2002'
    a_to_do_item.title = 'Get mail'
    a_to_do_item.description = 'from John'
    my_tasklist.add_task(a_to_do_item)
    #create a task that is complete but does not have a due date
    task_1 = Task.new
    task_1.title = 'Get groceries'
    task_1.description = 'from Joe'
    task_1.change_task_to_completed
    my_tasklist.add_task(task_1)
    #create a second to do item that is completed and has a due date
    a_to_do_item_1 = ToDoItem.new
    a_to_do_item_1.add_date = '02-10-1200'
    a_to_do_item_1.title = 'Get water'
    a_to_do_item_1.description = 'from Jill'
    a_to_do_item_1.change_task_to_completed
    my_tasklist.add_task(a_to_do_item_1)
    #due date that is not complete
    a_to_do_item_2 = ToDoItem.new
    a_to_do_item_2.add_date = '07-11-1999'
    a_to_do_item_2.title = 'walk the dog'
    a_to_do_item_2.description = 'he needs to go outside'
    my_tasklist.add_task(a_to_do_item_2)
    #due date that is not complete
    a_to_do_item_3 = ToDoItem.new
    a_to_do_item_3.add_date = '06-01-2005'
    a_to_do_item_3.title = 'read a book'
    a_to_do_item_3.description = 'to learn more'
    my_tasklist.add_task(a_to_do_item_3)
    #start running tests
    expect(my_tasklist.list).to eq [a_to_do_item, task_1, a_to_do_item_1, a_to_do_item_2, a_to_do_item_3]
    expect(my_tasklist.show_tasks_only).to eq [task_1]
    expect(my_tasklist.show_due_dates).to eq [a_to_do_item, a_to_do_item_1, a_to_do_item_2, a_to_do_item_3]
    expect(my_tasklist.incompleted_due_dates).to eq [a_to_do_item_2, a_to_do_item, a_to_do_item_3]
  end

  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.

  it 'should be able to show tasks with due dates' do
    my_tasklist = Tasklist.new
    a_to_do_item = ToDoItem.new
    a_to_do_item.add_date = '03-02-2002'
    a_to_do_item.title = 'Get mail'
    a_to_do_item.description = 'from John'
    my_tasklist.add_task(a_to_do_item)
    #create a task that is complete but does not have a due date
    task_1 = Task.new
    task_1.title = 'Get groceries'
    task_1.description = 'from Joe'
    task_1.change_task_to_completed
    my_tasklist.add_task(task_1)
    #create a second to do item that is completed and has a due date
    a_to_do_item_1 = ToDoItem.new
    a_to_do_item_1.add_date = '02-10-1200'
    a_to_do_item_1.title = 'Get water'
    a_to_do_item_1.description = 'from Jill'
    a_to_do_item_1.change_task_to_completed
    my_tasklist.add_task(a_to_do_item_1)
    #due date that is not complete
    a_to_do_item_2 = ToDoItem.new
    a_to_do_item_2.add_date = '07-11-1999'
    a_to_do_item_2.title = 'walk the dog'
    a_to_do_item_2.description = 'he needs to go outside'
    my_tasklist.add_task(a_to_do_item_2)
    #due date that is not complete
    a_to_do_item_3 = ToDoItem.new
    a_to_do_item_3.add_date = '06-01-2005'
    a_to_do_item_3.title = 'read a book'
    a_to_do_item_3.description = 'to learn more'
    my_tasklist.add_task(a_to_do_item_3)
    #start running tests
    expect(my_tasklist.list).to eq [a_to_do_item, task_1, a_to_do_item_1, a_to_do_item_2, a_to_do_item_3]
    expect(my_tasklist.show_tasks_only).to eq [task_1]
    expect(my_tasklist.show_due_dates).to eq [a_to_do_item, a_to_do_item_1, a_to_do_item_2, a_to_do_item_3]
    expect(my_tasklist.incompleted_due_dates).to eq [a_to_do_item_2, a_to_do_item, a_to_do_item_3]
  end
end
