require_relative 'test_helper'

class FizzBuzzTest < Minitest::Test

  def test_fizz_deluxe
    fizzbuzz = FizzBuzz.new(3)
    assert_equal 'fizz fake deluxe', fizzbuzz.fizz_buzz, 'App fizz deluxes for 3'
  end

  def test_buzz_deluxe
    fizzbuzz = FizzBuzz.new(5)
    assert_equal 'buzz fake deluxe', fizzbuzz.fizz_buzz, 'App buzz deluxes for 5'
  end

  def test_buzz
    fizzbuzz = FizzBuzz.new(10)
    assert_equal 'buzz', fizzbuzz.fizz_buzz, 'App buzzes for 10'
  end

  def test_fizz_buzz_deluxe
    fizzbuzz = FizzBuzz.new(15)
    assert_equal 'fizz buzz fake deluxe', fizzbuzz.fizz_buzz, 'App fizz buzzes for 15'
  end

  def test_return_number
    fizzbuzz = FizzBuzz.new(1)
    assert_equal 1, fizzbuzz.fizz_buzz, 'App returns the number otherwise'
  end

  def test_36
    fizzbuzz = FizzBuzz.new(36)
    assert_equal 'fizz deluxe', fizzbuzz.fizz_buzz
  end

  def test_3510
    fizzbuzz = FizzBuzz.new(3510)
    assert_equal 'fizz buzz deluxe', fizzbuzz.fizz_buzz
  end
end
