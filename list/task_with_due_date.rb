require 'date'
require_relative 'task'


class ToDoItem < Task
  def initialize
    @date = Date.new(2001,2,3)
    super
  end

  def add_date
    @date
  end

  def add_date= date_string
    @date = Date.strptime(date_string.to_s, '%d-%m-%Y')
    @date = 'Date: ' + @date.to_s
  end

  def details
    @details = @title + "\n" +
    @description + "\n" +
    'Status: ' + done_status + "\n" +
    @date
  end
end
