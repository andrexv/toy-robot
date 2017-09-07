require "./lib/errors"
require "./lib/table"
require "./lib/robot"
require "./lib/simulator"

# Receives the example file and starts the simulator with its information.
# To run the application, from the command line use:
#
# ruby application.rb data/data-1
#
# In the data/ folder there are multiple examples that can be used to test
# the Robot simulator.

raise MissingFileError if ARGV[0].nil?

simulator = Simulator.new
simulator.start(ARGV[0])