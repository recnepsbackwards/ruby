require 'rspec'
require_relative 'task'
require_relative 'task_list'
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
end
