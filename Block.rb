class Block
  def initialize(args = {})
    @color = args.fetch(:color)
    @type = args.fetch(:type, "standard")
  end

  def to_s
    case @color
    when "red" then "R"
    when "green" then "G"
    when "blue" then "B"
    when "yellow" then "Y"
    when "pink" then "P"
    when "orange" then "O"
    end
  end
end