require 'rspec'
require_relative 'task'
require_relative 'task_list'
require_relative 'task_with_due_date'

# Story: As a developer, I can create a to do item with a due date, which can be changed.
describe ToDoItem do
  it 'should be a thing' do
    expect{ToDoItem.new}.to_not raise_error
  end

  it 'should have a due date and can be changed' do
    a_to_do_item = ToDoItem.new
    a_to_do_item.add_date = '03-02-2001'
    expect(a_to_do_item.add_date).to be_a String
  end

# Story: As a developer, I can print an item with a due date with field labels and values.
  it 'should print a to-do item with a due date and details' do
    a_to_do_item = ToDoItem.new
    a_to_do_item.title = "do this"
    a_to_do_item.description = "more stuff"
    a_to_do_item.add_date = '03-02-2001'
    expect(a_to_do_item.details).to eq 'Title: do this' + "\n" + 'Description: more stuff' + "\n" + 'Status: This task is not done.' + "\n" + 'Date: 2001-02-03'
  end


# Epic: Anniversary
#
# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: Do not use Date to store the date.
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
#
#
end
