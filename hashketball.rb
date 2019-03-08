# # Write your code here!
require 'pry'

def game_hash
  {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => {
        'Alan Anderson' => {
           :number => 0,
           :shoe => 16,
           :points => 22,
           :rebounds => 12,
           :assists => 12,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 1,
         },
         'Reggie Evans' => {
           :number => 30,
           :shoe => 14,
           :points => 12,
           :rebounds => 12,
           :assists => 12,
           :steals => 12,
           :blocks => 12,
           :slam_dunks => 7,
         },
         'Brook Lopez' => {
           :number => 11,
           :shoe => 17,
           :points => 17,
           :rebounds => 19,
           :assists => 10,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 15,
         },
         'Mason Plumlee' => {
           :number => 1,
           :shoe => 19,
           :points => 26,
           :rebounds => 12,
           :assists => 6,
           :steals => 3,
           :blocks => 8,
           :slam_dunks => 5,
         },
         'Jason Terry' => {
           :number => 31,
           :shoe => 15,
           :points => 19,
           :rebounds => 2,
           :assists => 2,
           :steals => 4,
           :blocks => 11,
           :slam_dunks => 1,
         },
      }
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => {
        'Jeff Adrien' => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        'Bismak Biyombo' => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        'DeSagna Diop' => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        'Ben Gordon' => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        'Brendan Haywood' => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        }
      }
    }
  }
end

# puts game_hash[:home][:players]

def num_points_scored(player_name)
  home_player = game_hash[:home][:players][player_name]
  away_player = game_hash[:away][:players][player_name]
  if home_player
    return home_player[:points]
  elsif away_player
    return away_player[:points]
  end
end

def shoe_size(player_name)
  home_player = game_hash[:home][:players][player_name]
  away_player = game_hash[:away][:players][player_name]
  if home_player
    return home_player[:shoe]
  elsif away_player
    return away_player[:shoe]
  end
end

def team_colors(team_name_string)
  if team_name_string == game_hash[:home][:team_name]
    puts "true"
    return game_hash[:home][:colors]
  else team_name_string == game_hash[:away][:team_name]
    puts "false"
    return game_hash[:away][:colors]
  end
  # binding.pry
end

def team_names()
  team_array = []
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]

  team_array << home_team_name
  team_array << away_team_name
  # binding.pry
  return team_array
end

def player_numbers(team_name_string)
  the_home_team = game_hash[:home][:team_name]
  the_away_team = game_hash[:away][:team_name]
  player_number_array = []

  if the_home_team == team_name_string
    game_hash[:home][:players].each do |player, stat|
      #stat.number
      player_number_array << stat[:number]
    end
  elsif the_away_team == team_name_string
    game_hash[:away][:players].each do |player, stat|
      player_number_array << stat[:number]
    end
  end
    return player_number_array
end

def player_stats(player_name)
  player_stats = {}
  game_hash[:home][:players].each do |player, stats|
    if player == player_name
      player_stats = stats
    end
  end
  game_hash[:away][:players].each do |player, stats|
    if player == player_name
      player_stats = stats
    end
  end
  return player_stats
end

def big_shoe_rebounds()
  player_name_array = []

  game_hash[:home][:players].each do |player, stats|
    binding.pry
    # player_name_array << {player : stats}
  end
  game_hash[:away][:players].each do |player, stats|
    # player_name_array << {player: stats}
  end

end
