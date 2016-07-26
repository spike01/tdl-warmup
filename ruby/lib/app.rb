require "./lib/fizzbuzz"

class App

  def sum(x, y)
    x + y
  end

  def increment(x)
    x + 1
  end

  def to_uppercase(string)
    string.upcase
  end

  def count_lines(string)
    string.split("\n").count
  end

  def hello(string)
    "Hello, #{string}!"
  end

  def fizz_buzz(number)
    FizzBuzz.new(number).fizz_buzz
  end
end
