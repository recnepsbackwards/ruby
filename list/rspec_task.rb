require 'rspec'
require_relative 'task'

# Story: As a developer, I can create a Task.

describe Task do
  it 'should be a thing' do
    expect{ Task.new }.to_not raise_error
  end

# Story: As a developer, I can give a Task a title and retrieve it.

  it 'should always have a title' do
    a_task = Task.new
    expect(a_task.title).to be_a String
  end

  it 'should be able to give a title and retrieve it' do
    a_task = Task.new
    a_task.title = 'Walk the cat'
    expect(a_task.title).to eq 'Title: Walk the cat'
  end

# Story: As a developer, I can give a Task a description and retrieve it.

  it 'should always have a description' do
    a_task = Task.new
    expect(a_task.description).to be_a String
  end

  it 'should be able to give a description and retrieve it' do
    a_task = Task.new
    a_task.description = 1
    expect(a_task.description).to eq 'Description: 1'
    a_task.description = 'something'
    expect(a_task.description).to eq 'Description: something'
  end

# Story: As a developer, I can print a Task with field labels and values.
  it 'should always have field labels and values' do
    a_task = Task.new
    a_task.title = "do this"
    a_task.description = "more stuff"
    expect(a_task.details).to be_a String
    expect(a_task.details).to eq 'Title: do this' + "\n" + 'Description: more stuff' + "\n" + 'Status: This task is not done.'
  end

# Story: As a developer, I can mark a Task done.

  it 'should be able to be marked done' do
    a_task = Task.new
    expect{a_task.change_task_to_completed}.to change{a_task.done}.to eq true
  end

  it 'should say if a task is done or not' do
    task_1 = Task.new
    task_1.change_task_to_completed
    task_2 = Task.new
    expect(task_1.done_status).to eq 'This task is done.'
    expect(task_2.done_status).to eq 'This task is not done.'
  end

# Story: As a developer, when I print a Task is done status is shown.

  it 'should show a done status' do
    a_task = Task.new
    expect(a_task.done_status).to be_a String
  end
end
