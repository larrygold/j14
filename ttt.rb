class Game
  attr_accessor :game_on, :boardcase_name

  def initialize
    @game_on = true
  end

end


class Player
  attr_accessor :player_name, :token_type, :player_status

  @@list_of_players = Array.new

  def initialize(player_name, token_type)
    @player_name = player_name
    @token_type = token_type
    @status = "ongoing"
    @@list_of_players.push(self)
  end

  def self.get_list_of_players
    return @@list_of_players
  end

end


class Board
  attr_accessor :boardcases_list_of_names, :boardcases_list_of_statuses, :board_status
  attr_reader :hash_case


  def initialize


  end


  def draw

  end

end


class BoardCase
  attr_accessor :boardcase_name, :boardcase_status

def initialize(boardcase_name)
  @boardcase_name = boardcase_name
  @boardcase_status = @boardcase_name
end

end

### INITIALIZING THE GAME ###

# Let's initialize the game and the board

game = Game.new
board = Board.new

#Let's create 9 boardcases
  boardcase_1 = BoardCase.new(1)
  boardcase_2 = BoardCase.new(2)
  boardcase_3 = BoardCase.new(3)
  boardcase_4 = BoardCase.new(4)
  boardcase_5 = BoardCase.new(5)
  boardcase_6 = BoardCase.new(6)
  boardcase_7 = BoardCase.new(7)
  boardcase_8 = BoardCase.new(8)
  boardcase_9 = BoardCase.new(9)
  hash_case = {1 => boardcase_1, 2 => boardcase_2, 3 => boardcase_3, 4 => boardcase_4, 5 => boardcase_5, 6 => boardcase_6, 7 => boardcase_7, 8 => boardcase_8, 9 => boardcase_9}

#Let's prompt the user to write the names of the 2 players
puts "Please enter the name of the player 1: you will have tokens X"
input_1 = gets.chomp
player_1 = Player.new(input_1, "X")

puts "Please enter the name of the player 2: you will have tokens O"
input_2 = gets.chomp
player_2 = Player.new(input_2, "O")





### MAIN GAME LOOP ###

  100.times do |tour|
    tour += 1
    puts "\n------------------ Round number #{tour} ------------------"


    puts "#{boardcase_1.boardcase_name} | #{boardcase_2.boardcase_name} | #{boardcase_3.boardcase_name}"
    puts "----------"
    puts "#{boardcase_4.boardcase_name} | #{boardcase_5.boardcase_name} | #{boardcase_6.boardcase_name}"
    puts "----------"
    puts "#{boardcase_7.boardcase_name} | #{boardcase_8.boardcase_name} | #{boardcase_9.boardcase_name}"

    if tour%2 != 0

    puts "#{Player.get_list_of_players[0].player_name}, you play!"

    puts "Please enter the number of the case you want to play."

    boardcase_number_key = gets.chomp.to_i
    boardcase_instance_chosen = hash_case[boardcase_number_key]

    else

    puts "#{Player.list_of_players[1]}, you play!"
    puts "Please enter the number of the case you want to play."
    boardcase_number_key = gets.chomp.to_i
    boardcase_instance_chosen = hash_case[boardcase_number_key]

    end

  end
