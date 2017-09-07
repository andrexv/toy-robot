# The Table class has its dimensions and any other behavior
# related to it
class Table
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end