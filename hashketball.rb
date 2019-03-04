# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: {
        'Alan Anderson' => {
          number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5
        },
        'Jason Terry' => {
          number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1
        }
        
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise','Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0
        },
        'Brendan Haywood' => {
          number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12
        }
        
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute,data|
      #binding.pry
      if (attribute == :players) && (data.keys.include?(name))
        #binding.pry
        return  data[name][:points]
      end
    end
  end
end

def shoe_size(name)
    game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute,data|
      #binding.pry
      if (attribute == :players) && (data.keys.include?(name))
        #binding.pry
        return  data[name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    #binding.pry
    if (team_data[:team_name] == team_name)# && ()
      #binding.pry
      return team_data[:colors]
    end
  end
end

def team_names
  [game_hash[:home][:team_name] , game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    if (team_data[:team_name] == team_name)
      team_data.each do | attribute , data |
        #binding.pry
        if attribute == :players
          data.each do |type , stat|
            player_numbers << stat[:number]
            #binding.pry
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(name)
    game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute,data|
      #binding.pry
      if (attribute == :players) && (data.keys.include?(name))
        #binding.pry
        return  data[name]
      end
    end
  end
end

def big_shoe_rebounds
  biggest_guy = ''
  biggest_size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      #binding.pry
      if (attribute == :players)
        #binding.pry
        data.each do |type, stat|
          #binding.pry
          if stat[:shoe] > biggest_size
            biggest_size = stat[:shoe]
            biggest_guy = type
          end
        end
      end
    end
  end
  if game_hash[:home][:players].key?(biggest_guy)
    return game_hash[:home][:players][biggest_guy][:rebounds]
  end
  game_hash[:away][:players][biggest_guy][:rebounds]
end

def most_points_scored
  biggest_points_guy = ''
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      #binding.pry
      if (attribute == :players)
        #binding.pry
        data.each do |type, stat|
          #binding.pry
          if stat[:points] > points
            points = stat[:shoe]
            biggest_points_guy = type
          end
        end
      end
    end
  end
  #binding.pry
  biggest_points_guy
end

def winning_team
  home_points_scored = 0
  away_points_scored = 0
  #binding.pry
  game_hash[:home][:players].keys.each { |name| home_points_scored += num_points_scored(name)}
  game_hash[:away][:players].keys.each { |name| away_points_scored += num_points_scored(name)}
  return game_hash[:home][:team_name] if home_points_scored > away_points_scored
  return game_hash[:away][:team_name] if home_points_scored < away_points_scored
end


def player_with_longest_name
  biggest_name_guy = ''
  name_length = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      #binding.pry
      if (attribute == :players)
        #binding.pry
        data.each do |type, stat|
          #binding.pry
          if type.size > name_length
            name_length = type.size
            biggest_name_guy = type
          end
        end
      end
    end
  end
  #binding.pry
  biggest_name_guy
end

def long_name_steals_a_ton?
  biggest_steals_guy = ''
  steals = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      #binding.pry
      if (attribute == :players)
        #binding.pry
        data.each do |type, stat|
          #binding.pry
          if stat[:steals] > steals
            steals = stat[:steals]
            biggest_steals_guy = type
          end
        end
      end
    end
  end
  #binding.pry
  if biggest_steals_guy == player_with_longest_name
    true
  else
    false
  end
end