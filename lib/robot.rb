# The Class Robot is used to manage the movement of the mechanical man,
# its position and its behavior in general
class Robot
  attr_reader :placed
  DIRECTIONS = %w(north east south west)

  def initialize(posX, posY, facing, table)
    @posX = posX
    @posY = posY
    @facing = facing
    @placed = false
    @table = table
  end

  # It will change its position, depending on where it is facing
  def move
    case @facing
    when "north"
      @posY += 1 if @posY+1 < @table.width
    when "east"
      @posX += 1 if @posX+1 < @table.height
    when "south"
      @posY -= 1 if @posY-1 >= 0
    when "west"
      @posX -= 1 if @posX-1 >= 0
    end
  end

  # Validates that the args are valid before assigning them
  def place(args)
    return if (args.empty?) ||
              (args.length != 3) ||
              (args[0].to_i < 0 || args[0].to_i >= @table.height) ||
              (args[1].to_i < 0 || args[1].to_i >= @table.width) ||
              !DIRECTIONS.include?(args[2])

    @posX = args[0].to_i
    @posY = args[1].to_i
    @facing =  args[2]
    @placed = true
  end

  # Turns the robot clockwise
  def turn_right
    index = DIRECTIONS.index(@facing)+1
    @facing = DIRECTIONS[index] || DIRECTIONS[0]
  end

  # Turns the robot counter-clockwise
  def turn_left
    index = DIRECTIONS.index(@facing)-1
    @facing = DIRECTIONS[index]
  end

  # Returns an array with the posX, posY and direction where the robot
  # is facing
  def location
    [@posX, @posY, @facing]
  end
end