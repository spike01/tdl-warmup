require 'tdl'
require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

require_relative './app'

include TDL::ClientActions

# ~~~~~~~~~ Setup ~~~~~~~~~

I_AM_READY = true

# ~~~  How to run ~~~
#
# From command line:
#     If you want to trial run:     rake run
#     If you are ready to go live:  rake run ready=true
#
# From IDE:
#     Run this file from your IDE
#     Set the I_AM_READY variable to "true" if ready to go live
#
def main(argv)
  value_from_commandline = (argv.length > 0 and argv[0] == 'true')
  ready = (I_AM_READY or value_from_commandline)
  puts("Ready ? = #{ready}")

  start_client(ready)
end

def start_client(ready)
  client = TDL::Client.new(hostname: 'localhost', username: 'julian')

  rules = TDL::ProcessingRules.new
  rules.on('display_description').call(method(:display_description)).then(publish)
  rules.on('sum').call(App.new.method(:sum)).then(publish_if(ready))

  client.go_live_with(rules)
end

def publish_if(ready)
  ready ? publish : stop
end

# ~~~~~~~~~ Provided implementations ~~~~~~~~~

def display_description(label, description)
  puts description
  output = File.open("challenges/#{label}.txt", 'w')
  output << description
  output.close
  puts "Challenge description saved to file: #{output.path}."
  'OK'
end


# ~~~~~~~~~ Run ~~~~~~~~~

main(ARGV)
