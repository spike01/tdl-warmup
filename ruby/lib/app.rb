require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

require 'tdl'
require 'app/sum'

client = TDL::Client.new('localhost', 61613, 'test')

client.trial_run_with { |params|
  sum(params[0].to_i, params[1].to_i)
}