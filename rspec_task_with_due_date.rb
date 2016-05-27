require 'rspec'
require_relative 'task'
require_relative 'task_list'
require_relative 'task_with_due_date'

# Story: As a developer, I can create a to do item with a due date, which can be changed.
describe Duedate do
  it 'should be a thing'do
    expect{Duedate.new}.to_not raise_error
  end
# Story: As a developer, I can print an item with a due date with field labels and values.
  
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
#
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
