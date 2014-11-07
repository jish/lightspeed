require 'minitest/autorun'
require 'lightspeed/ping'

describe Lightspeed::Ping do

  class MockRunner
    attr_reader :command, :output

    def initialize(output)
      @output = output
    end

    def run_command(*args)
      @command = args
    end
  end

  subject { Lightspeed::Ping.new(mock_runner) }

  let(:mock_runner) { MockRunner.new(ping_output) }

  let(:ping_output) { <<-OUTPUT
    PING google.com (74.125.239.40): 56 data bytes
    64 bytes from 74.125.239.40: icmp_seq=0 ttl=54 time=3.723 ms
    64 bytes from 74.125.239.40: icmp_seq=1 ttl=54 time=5.142 ms
    64 bytes from 74.125.239.40: icmp_seq=2 ttl=54 time=4.699 ms
    64 bytes from 74.125.239.40: icmp_seq=3 ttl=54 time=4.109 ms
    64 bytes from 74.125.239.40: icmp_seq=4 ttl=54 time=5.059 ms

    --- google.com ping statistics ---
    5 packets transmitted, 5 packets received, 0.0% packet loss
    round-trip min/avg/max/stddev = 3.723/4.546/5.142/0.550 ms
    OUTPUT
  }

  it "pings servers" do
    assert_equal 4.546, subject.ping("google.com")
  end

  it "processes output" do
    retval = subject.process_output(ping_output)
    assert_equal 4.546, retval.avg
  end

end
