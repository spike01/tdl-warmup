# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test

  def setup
    @app = App.new
  end

  attr_reader :app

  def test_sum
    assert_equal 3, app.sum(1, 2), 'App should add two numbers'
  end

  def test_increment
    assert_equal 3, app.increment(2), 'App should increment a number'
  end

  def test_uppercase
    assert_equal 'HELLO', app.to_uppercase('hello'), 'App should uppercase a string'
  end

  def test_count_lines
    assert_equal 3, app.count_lines("G\no\nT"), 'App should count lines'
  end

  def test_count_lines_empty_string
    assert_equal 0, app.count_lines(''), 'App should count zero for an empty string'
  end

  def test_hello_world
    assert_equal 'Hello, John!', app.hello('John'), 'App should greet people' 
  end

end
