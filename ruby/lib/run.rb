require 'tdl'
require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

require_relative './app'
app = App.new

#  STEP 1: Set the username as your name
client = TDL::Client.new(hostname: '172.20.10.2', username: 'peter')

include TDL::ClientActions
rules = TDL::ProcessingRules.new

rules
  .on('display_description')
  .call(->(label, details){
    puts details
    output = File.open("challenges/#{label}.txt", "w")
    output << details
    output.close
    puts "Challenge description saved to file #{output.path}."
    'OK'
  })
  .then(publish)

# STEP 3: Once happy with your implementation go live with you solution.

rules.on('increment').call(app.method(:increment)).then(publish)
# rules.on('increment').call(app.method(:increment)).then(stop)

client.go_live_with(rules)
