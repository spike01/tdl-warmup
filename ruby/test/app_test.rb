# noinspection RubyResolve,RubyResolve
require 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test

  def setup
    @app = App.new
  end

  attr_reader :app

  def test_sum
    assert_equal app.sum(1, 2), 3, 'App should add two numbers'
  end

end
