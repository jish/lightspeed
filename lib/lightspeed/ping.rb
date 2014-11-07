require 'lightspeed/command_runner'

module Lightspeed
  class Ping

    attr_reader :command_runner

    Stats = Struct.new(:avg)

    def initialize(command_runner = nil)
      @command_runner = command_runner || CommandRunner.new
    end

    def ping(server)
      command_runner.run_command("ping", "-c", "1", server)
      process_output(command_runner.output).avg
    end

    def process_output(output)
      last_line = output.split("\n").last
      match_data = last_line.match(/= [^\/]+\/([^\/]+)\//)
      stats = Stats.new(match_data[1].to_f)
    end

  end
end
