module Menu
  def menu
  "Welcome to the Liverpool team creater, please select from the following options:
  1) Add Player
  2) Show Team
  3) Quit "
  end
  def show
    menu
  end
end

module Promtable
  def prompt(message = "What would you like to do?", symbol = ":> ")
    print message
    print symbol
    gets.chomp
  end
end

class Team
  def initialize
    @all_players = []
  end
  def add(player)
    @all_players << player
  end
  attr_reader :all_players
  def show
    all_players; end
end

class Players
  attr_reader :name
  attr_reader :position
  def initialize(name, position)
    @name = name
    @position = position
  end
  def to_s
      "#{position} : #{name}"
    end
end

if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promtable
    my_team = Team.new
    puts "Please choose from the following list: "
    until ['q'].include?(user_input = prompt(show).downcase)
      case user_input
      when '1' 
        my_team.add(Players.new(prompt("What is the name of the player you'd like to add?"), prompt("What position?")))
      when '2' 
        puts my_team.show
      else 
        puts "Sorry I didn't get that."
      end
      prompt "Press Enter to continue"
    end
    puts "Outro - Thanks for participating!"
  end