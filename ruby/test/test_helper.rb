$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'app/sum'

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :debug