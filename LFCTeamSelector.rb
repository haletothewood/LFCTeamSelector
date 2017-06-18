module Menu
  def menu
  "Welcome to my Liverpool Team Selector, please select from the following options:
  1) Add Player
  2) Show Team
  3) Save Your Team
  4) Load a Previously Created Team
  5) Quit "
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
    all_players
  end
  def write_to_file(filename)
        IO.write(filename, @all_players.map(&:to_s).join("\n"))
  end
  def read_from_file(filename)
        IO.readlines(filename).each do |line|
          puts line
        end
  end
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
    until ['5'].include?(user_input = prompt(show))
      case user_input
      when '1' 
        my_team.add(Players.new(prompt("What is the name of the player you'd like to add?"), prompt("What position? (eg., GK/RB/LW)")))
      when '2'
        puts "Here is your team:" 
        puts my_team.show
      when '3'
        my_team.write_to_file(prompt("What is the filename you'd like to save to?"))
      when '4'
        begin
        my_team.read_from_file(prompt("What is the filename you'd like to load?"))
        rescue Errno::ENOENT
          puts 'Filename not found, please verify your filename and path.'
        end
      else 
        puts "Sorry I didn't get that."
      end
      prompt "Please press Enter to continue"
    end
    puts "Outro - Thanks for participating! With that team clearly this year is our year!"
  end