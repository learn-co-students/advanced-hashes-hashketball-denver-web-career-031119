# Write your code here!
# require "pry"

def game_hash
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  hashketball
end

def num_points_scored(player)
  hashketball = game_hash
  hashketball.each do |teams, team_attributes|
    if team_attributes[:players].has_key?(player)
      return team_attributes[:players][player][:points]
    end
  end
end

def shoe_size(player)
  hashketball = game_hash
  hashketball.each do |teams, team_attributes|
    if team_attributes[:players].has_key?(player)
      return team_attributes[:players][player][:shoe]
    end
  end
end

def team_colors(team)
  hashketball = game_hash
  hashketball.each do |teams, team_attributes|
    if team_attributes[:team_name] == team
      return team_attributes[:colors]
    end
  end
end

def team_names
  hashketball = game_hash
  who_is_playing = []
  hashketball.each do |teams, team_attributes|
    who_is_playing << team_attributes[:team_name]
  end
  return who_is_playing
end

def player_numbers(team)
  hashketball = game_hash
  jersey_numbers = []
  hashketball.each do |teams, team_attributes|
    if team_attributes[:team_name] == team
      team_attributes[:players].each do |player, player_stats|
        jersey_numbers << player_stats[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player)
  hashketball = game_hash
  hashketball.each do |teams, team_attributes|
    if team_attributes[:players].has_key?(player)
      return team_attributes[:players][player]
    end
  end
end

def big_shoe_rebounds
  hashketball = game_hash
  biggest_shoe = 0
  rebounds = 0
  hashketball.each do |teams, team_attributes|
    team_attributes[:players].each do |player, player_stats|
      if player_stats[:shoe] > biggest_shoe
        biggest_shoe = player_stats[:shoe]
        rebounds = player_stats[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  hashketball = game_hash
  most_points = 0
  highest_scoring_player = ""
  hashketball.each do |teams, team_attributes|
    team_attributes[:players].each do |player, player_stats|
      if player_stats[:points] > most_points
        most_points = player_stats[:points]
        highest_scoring_player = player
      end
    end
  end
  return highest_scoring_player
end

def winning_team
  hashketball = game_hash
  home_points = 0
  away_points = 0
  hashketball[:home][:players].each do |player, player_stats|
    home_points += player_stats[:points]
  end
  
  hashketball[:away][:players].each do |player, player_stats|
    away_points += player_stats[:points]
  end
  
  if home_points > away_points
    return hashketball[:home][:team_name]
  else
    return hashketball[:away][:team_name]
  end
end

def player_with_longest_name
  hashketball = game_hash
  player_characters = 0
  longest_named_player = ""
  hashketball.each do |teams, team_attributes|
    team_attributes[:players].each do |player, player_stats|
      if player.length > player_characters
        player_characters = player.length
        longest_named_player = player
      end
    end
  end
  return longest_named_player
end

def long_name_steals_a_ton?
  hashketball = game_hash
  lots_of_steals = 10
  hashketball.each do |teams, team_attributes|
    team_attributes[:players].each do |player, player_stats|
      if player == player_with_longest_name && player_stats[:steals] > lots_of_steals
        return true
      end
    end
  end
end
