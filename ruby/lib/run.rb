require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

require_relative './app'

require 'logging'
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

app = App.new()
app.main()
