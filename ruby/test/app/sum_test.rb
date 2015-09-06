# noinspection RubyResolve,RubyResolve
require 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test


  def test_sum_should_work
    assert_equal sum(1, 2), 3, 'Different sum.'
  end

end