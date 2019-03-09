# Write your code here!
require 'pry'


def game_hash
  the_game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(players_name)

  game_hash.each do |home_away, team_data|
    #2 loop checks here, only 1 for home and 1 for away
    #binding.pry
    team_data.each do |attribute, attr_data|
      #3 loop checks here, we are looking for the :players attribute
      #binding.pry
      if attribute == :players
        attr_data.each do |player|
          #Found players name, return the points associated with player
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |home_away, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players
        attr_data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(my_team)
  game_hash.each do |home_away, team_data|
    #Check both home and away once to find the correct team
      if team_data[:team_name] == my_team
        #Return the colors in it's natural element as an array for the
        # correct team
        return game_hash[home_away][:colors]
      end
  end
end

def team_names
  result = []
  game_hash.each do |home_away, team_data|
    #For each home and away team, which there are only two at the moment
    # we will add the team name to our result array and then return it at the end
    result << game_hash[home_away][:team_name]
  end
return result
end

def player_numbers(my_team)
  result = []
  game_hash.each do |home_away, team_data|
    if team_data[:team_name] == my_team
      team_data.each do |attribute, attr_data|
        if attribute == :players
          #binding.pry
          attr_data.each do |player|
          #  binding.pry
            result << player[:number]
          end
        end
      end
    end
  end
  return result
end

def player_stats(players_name)
  result = {}
  game_hash.each do |home_away, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players
        attr_data.each do |player|
          if player[:player_name] == players_name
            result = player
            result.delete(:player_name)
            return result
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  name_result = ""

  #Get the largest shoe size
  game_hash.each do |home_away, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players
        attr_data.each do |player|
          if largest_shoe_size < player[:shoe]
            largest_shoe_size = player[:shoe]
          end
        end
      end
    end
  end
#binding.pry

#Find players number of rebounds with largest shoe size
  game_hash.each do |home_away, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players
        attr_data.each do |player|
          if largest_shoe_size == player[:shoe]
            return player[:rebounds]
          end
        end
      end
    end
  end
end
