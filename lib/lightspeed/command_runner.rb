require 'open3'

module Lightspeed
  class CommandRunner

    attr_reader :output

    def run_command(*args)
      stdin, stdout, stderr = Open3.popen3(*args)
      @output = stdout.read
    end

  end
end
