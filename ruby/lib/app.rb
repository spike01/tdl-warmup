require 'tdl'

class App

  def main()
    client = TDL::Client.new('localhost', 61613, 'test')

    client.trial_run_with { |params|
      App.sum(params[0].to_i, params[1].to_i)
    }
  end

  def self.sum(x, y)
    nil
  end
end