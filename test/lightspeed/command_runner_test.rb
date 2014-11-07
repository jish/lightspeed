require 'minitest/autorun'
require 'lightspeed/command_runner'

describe Lightspeed::CommandRunner do

  subject { Lightspeed::CommandRunner.new }

  it "runs commands" do
    subject.run_command("echo", "Hello World!")
    assert_equal `echo Hello World!`, subject.output
  end

end
