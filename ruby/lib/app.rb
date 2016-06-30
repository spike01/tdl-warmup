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

  class FizzBuzz
    def initialize(number)
      @number = number
    end

    def fizz_buzz
      return result.map(&:first).join(' ') if result.length > 0
      number
    end

    private
    attr_reader :number

    def result
      rules.select { |(_, rule)| rule.call }
    end

    def rules
      [
        ['fizz', -> { divisible_by?(3) || contains?(3) }],
        ['buzz', -> { divisible_by?(5) || contains?(5) }],
        ['fake', -> { deluxe? && number.odd? }],
        ['deluxe', -> { deluxe? }]
      ]
    end

    def deluxe?
      divisible_by?(3) && contains?(3) || divisible_by?(5) && contains?(5)
    end

    def divisible_by?(divisor)
      number % divisor == 0
    end

    def contains?(other_number)
      number.to_s.include?(other_number.to_s)
    end
  end
end
