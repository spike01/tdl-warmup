require 'tdl'
require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

require_relative './app'
app = App.new

#  STEP 1: Set the username as your name
client = TDL::Client.new('172.20.10.2', 61613, 'peter')

include TDL::ClientActions
rules = TDL::ProcessingRules.new
rules.on('display_description').call(app.method(:display)).then(publish)
rules.on('display_required_methods').call(app.method(:display)).then(publish)

# STEP 3: Once happy with your implementation go live with you solution.

# rules.on('increment').call(app.method(:increment)).then(publish)
rules.on('increment').call(app.method(:increment)).then(stop)

client.go_live_with(rules)
