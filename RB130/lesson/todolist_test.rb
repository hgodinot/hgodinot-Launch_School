require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end 
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    list_bis = @list.clone
    assert_equal(@todo1, list_bis.shift)
    assert_equal([@todo2, @todo3], list_bis.to_a)
  end
  
  def test_pop
    list_bis = @list.clone
    assert_equal(@todo3, list_bis.pop)
    assert_equal([@todo1, @todo2], list_bis.to_a)
  end
  
  def test_done
    assert_equal(false, @list.done?)
  end
  
  def test_raises
    assert_raises(TypeError) {@list.add(4)}
    assert_raises(TypeError) {@list.add("hello")}
  end
  
  def test_shovel
    todo4 = Todo.new("random")
    todo5 = Todo.new("else")
    @list << (todo4)
    assert_equal(todo4, @list.last)
    @list.add(todo5)
    assert_equal(todo5, @list.last)
  end
  
  def test_item_at
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(10) }
  end
  
  def test_mark_done_at
    @list.mark_done_at(2)
    assert_raises(IndexError) { @list.mark_done_at(10) }
    assert_equal(true, @todo3.done?)
    refute_equal(true, @todo2.done?)
  end
  
  def test_mark_undone_at
    @list.mark_done_at(1)
    @list.mark_done_at(2)
    @list.mark_undone_at(1)
    assert_raises(IndexError) { @list.mark_undone_at(10) }
    refute_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @list.done!
    @list.add(Todo.new("else"))
    refute_equal(true, @list.done?)
    @list.pop
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError)  { @list.remove_at(10) }
    @list.remove_at(2)
    assert_equal(@todo2, @list.last)
  end
  
  def test_to_s
    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    HEREDOC
    assert_equal(output, @list.to_s)
    
    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    HEREDOC
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
    
    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    HEREDOC
    @list.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    @list.each { |item| item.done! }
    assert_equal(true, @list.done?)
    
    @list.each { |_| }.done!
    assert_equal(@list, @list.each { |_| })
  end
  
  def test_select
    @list.done!
    list_select = @list.select { |item| item.done? }
    assert_equal(true, list_select.done?)
    refute_equal(list_select, @list)
  end
end
