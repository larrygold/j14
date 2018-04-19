class Game
  attr_accessor :boardcase_name, :player_1, :player_2, :board

  def initialize

    #Let's initialize the board
    @board = Board.new

    #Let's prompt the user to write the names of the 2 players
    puts "Please enter the name of the player 1: you will have tokens X"
    @input_1 = gets.chomp
    @player_1 = Player.new(@input_1, "X")

    puts "Please enter the name of the player 2: you will have tokens O"
    @input_2 = gets.chomp
    @player_2 = Player.new(@input_2, "O")

  end

  def game_on?

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
  attr_accessor :boardcases_list_of_names, :boardcases_list_of_statuses, :board_status, :boardcase_1, :boardcase_2, :boardcase_3, :boardcase_4, :boardcase_5, :boardcase_6, :boardcase_7, :boardcase_8, :boardcase_9
  attr_reader :hash_case


  def initialize

    #Let's create 9 boardcases
      @boardcase_1 = BoardCase.new(1)
      @boardcase_2 = BoardCase.new(2)
      @boardcase_3 = BoardCase.new(3)
      @boardcase_4 = BoardCase.new(4)
      @boardcase_5 = BoardCase.new(5)
      @boardcase_6 = BoardCase.new(6)
      @boardcase_7 = BoardCase.new(7)
      @boardcase_8 = BoardCase.new(8)
      @boardcase_9 = BoardCase.new(9)
      @hash_case = {1 => @boardcase_1, 2 => @boardcase_2, 3 => @boardcase_3, 4 => @boardcase_4, 5 => @boardcase_5, 6 => @boardcase_6, 7 => @boardcase_7, 8 => @boardcase_8, 9 => @boardcase_9}


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

# Let's initialize the game

game = Game.new

### MAIN GAME LOOP ###

  100.times do |tour|
    tour += 1
    puts "\n------------------ Round number #{tour} ------------------"


    puts "#{game.board.boardcase_1.boardcase_status} | #{game.board.boardcase_2.boardcase_status} | #{game.board.boardcase_3.boardcase_status}"
    puts "----------"
    puts "#{game.board.boardcase_4.boardcase_status} | #{game.board.boardcase_5.boardcase_status} | #{game.board.boardcase_6.boardcase_status}"
    puts "----------"
    puts "#{game.board.boardcase_7.boardcase_status} | #{game.board.boardcase_8.boardcase_status} | #{game.board.boardcase_9.boardcase_status}"

    if tour%2 != 0
      ongoing_player = game.player_1
      puts "#{Player.get_list_of_players[0].player_name}, you play!"
    else
      ongoing_player = game.player_2
      puts "#{Player.get_list_of_players[1].player_name}, you play!"
    end

    puts "Please enter the number of the case you want to play."

    boardcase_number_key = gets.chomp.to_i
    boardcase_instance_chosen = game.board.hash_case[boardcase_number_key]

      if boardcase_instance_chosen.boardcase_status == "X" || boardcase_instance_chosen.boardcase_status == "O"

        while boardcase_instance_chosen.boardcase_status == "X" || boardcase_instance_chosen.boardcase_status == "O" do
        puts "Please enter the number of a case that has not been played yet!"
        boardcase_number_key = gets.chomp.to_i
        boardcase_instance_chosen = game.board.hash_case[boardcase_number_key]
        end

        boardcase_instance_chosen.boardcase_status = ongoing_player.token_type

      else
        boardcase_instance_chosen.boardcase_status = ongoing_player.token_type

      end

  end
