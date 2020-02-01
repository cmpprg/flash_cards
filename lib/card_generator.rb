class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
    generate_cards
  end

# open file for reading,
# start iteration:
  # capture single line, transform string to array,
  # create new card, populate @cards,
#end iteration
# close file.
  def generate_cards
    target_file = File.open(@filename)
    until target_file.eof?
      line = target_file.readline.chomp
      line_split = line.split(",")
      card = Card.new(line_split[0], line_split[1], line_split[2])
      @cards << card
    end
    target_file.close
  end

end
