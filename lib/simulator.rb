# The Simulator Class is the one that creates elements needed and
# gives the user the ability to start moving the robot anywhere in the
# table.
class Simulator
  ACTIONS = %w(place move report left right)

  def initialize
    @table = Table.new(5, 5)
    @robot = Robot.new(0,0,"north", @table)
  end

  # Receives a file that has the information from the user and parses it
  def start(file_name)
    puts "="*50
    puts "STARTING ROBOT SIMULATOR APP"
    puts "="*50
    fileInfo = open_file(file_name)
    commands = fileInfo.split("\n").map(&:strip).reject(&:empty?)

    commands.each do |command|
      command_array = command.downcase.split
      action = command_array[0]
      arguments = command_array[1] ? command_array[1].split(",") : []

      next if action[0] == "#"
      receive_action(action, arguments)
    end
    puts "="*50
    puts "ENDING ROBOT SIMULATOR APP"
    puts "="*50
  end

  # Returns file information from a given file name
  def open_file(file_name)
    begin
      File.read(file_name)
    rescue
      raise MissingFileError
    end
  end

  def prints_robot_location
    puts "*"*50
    puts "REPORT"
    puts "-"*50
    puts "Robot position in the table is: ["+@robot.location[0].to_s+","+@robot.location[1].to_s+"]"
    puts "Robot facing to: "+@robot.location[2].to_s.upcase
    puts "-"*50
  end

  # Receives an action, validates if it's allowed and runs it.
  # The Robot is allowed to perform actions after it is placed correctly
  # in the table
  def receive_action(action, arguments)
    puts "Perform action: "+action.upcase+" "+arguments.to_s

    return unless action == "place" || @robot.placed
    raise InvalidInputError unless ACTIONS.include?(action)

    case action
    when "move"
      @robot.move
    when "report"
      prints_robot_location
    when "left"
      @robot.turn_left
    when "right"
      @robot.turn_right
    when "place"
      @robot.place(arguments)
    else
      raise UndefinedActionError
    end
  end
end