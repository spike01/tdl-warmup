require 'tdl'
require 'ostruct'
require 'json'

class App

  def main()
    # Starts a new TDL client TDL::Client.new(host, port, username);
    client = TDL::Client.new('172.20.10.2', 61613, 'username')

    solution = OpenStruct.new({
      display_description: ->(description){ puts description; "OK" },
      display_required_methods: ->(required_methods){ puts required_methods; "OK" },

      # STEP 1: Implement a function that takes a number and returns the next number.

      # Uncomment this implementation or write your own.
      # increment: ->(x){ x+1 }
    })
    def solution.method_missing(meth, *other)
      ->(*args){ puts "method missing #{meth}"}
    end
    def solution.respond_to(*a)
      true
    end

    # STEP 2: Once happy with your implementation go live with you solution.
    # Uncomment this line and comment out the trial run.
    # client.go_live_with solution
    client.trial_run_with solution
  end

  def self.sum(x, y)
    nil
  end
end
