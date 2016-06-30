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

  def test_fizz_deluxe
    assert_equal 'fizz fake deluxe', app.fizz_buzz(3), 'App fizz deluxes for 3'
  end

  def test_buzz_deluxe
    assert_equal 'buzz fake deluxe', app.fizz_buzz(5), 'App buzz deluxes for 5'
  end

  def test_buzz
    assert_equal 'buzz', app.fizz_buzz(10), 'App buzzes for 10'
  end

  def test_fizz_buzz_deluxe
    assert_equal 'fizz buzz fake deluxe', app.fizz_buzz(15), 'App fizz buzzes for 15'
  end

  def test_return_number
    assert_equal 1, app.fizz_buzz(1), 'App returns the number otherwise'
  end

  def test_36
    assert_equal 'fizz deluxe', app.fizz_buzz(36)
  end

  def test_3510
    assert_equal 'fizz buzz deluxe', app.fizz_buzz(3510)
  end
end
