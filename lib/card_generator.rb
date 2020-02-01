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
  # strip each element to ensure no white space on front or back.
  # create new card, populate @cards,
#end iteration
# close file.
  def generate_cards
    target_file = File.open(@filename)
    until target_file.eof?
      single_line = target_file.readline.chomp
      data_set = single_line.split(",")
      stripped_data = data_set.map{|datum| datum.strip}
      card = Card.new(stripped_data[0], stripped_data[1], stripped_data[2])
      @cards << card
    end
    target_file.close
  end

end
