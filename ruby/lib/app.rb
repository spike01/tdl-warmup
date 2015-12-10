require 'tdl'
require 'ostruct'
require 'json'


class App

  #  STEP 1: Set username as your name
  def username
    "username"
  end

  # STEP 2: Implement a function that takes a number and returns the next number.
  # Uncomment this implementation or write your own.
  def increment(i)
    i + 1
  end

  # STEP 3: Once happy with your implementation go live with you solution.
  def ready?
    false
  end

  def display_description(description)
    puts description
    "OK"
  end

  def display_required_methods(required_methods)
    required_methods
    "OK"
  end


  def main()
    # Starts a new TDL client TDL::Client.new(host, port, username);
    client = TDL::Client.new('172.20.10.2', 61613, username)
    puts "hello"
    if ready?
      client.go_live_with self
    else
      client.trial_run_with self
    end
  end

end
