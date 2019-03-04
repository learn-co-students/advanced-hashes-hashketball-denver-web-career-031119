# Write your code here!
require "pry"

def game_hash
  {
  home: {
    team_name: "Brooklyn Nets",
    colors:["Black", "White"],
    players:{
      "Alan Anderson" => {
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1
      },
     "Reggie Evans" => {
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7
      },
      "Brook Lopez"=> {
      number: 11,
      shoe: 17,
      points: 17,
      rebounds: 19,
      assists: 10,
      steals: 3,
      blocks: 1,
      slam_dunks: 15
      },
      "Mason Plumlee" => {
      number: 1,
      shoe: 19,
      points: 26,
      rebounds: 12,
      assists: 6,
      steals: 3,
      blocks: 8,
      slam_dunks: 5
      },
      "Jason Terry" => {
      number: 31,
      shoe: 15,
      points: 19,
      rebounds: 2,
      assists: 2,
      steals: 4,
      blocks: 11,
      slam_dunks: 1
    }
  }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
      number: 4,
      shoe: 18,
      points: 10,
      rebounds: 1,
      assists: 1,
      steals: 2,
      blocks: 7,
      slam_dunks: 2
      },
      "Bismak Biyombo" => {
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 7,
      blocks: 15,
      slam_dunks: 10
      },
      "DeSagna Diop" => {
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5
      },
      "Ben Gordon" => {
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0
      },
      "Brendan Haywood" => {
      number: 33,
      shoe: 15,
      points: 6,
      rebounds: 12,
      assists: 12,
      steals: 22,
      blocks: 5,
      slam_dunks: 12
      }
    }
  }
}
end

def num_points_scored(players_name)
  game_hash.each do |side, data|
    data.each do |k, v|
       return game_hash[side][k][players_name][:points] if v.include?(players_name)
      end
  end
end

def shoe_size(players_name)
game_hash.each { |side, data|
  data.each { |k, v|
    return game_hash[side][k][players_name][:shoe] if v.include?(players_name)
  }
}
end

def team_colors(team_name)
  game_hash.each do |side, data|
    return data[:colors] if data[:team_name] == team_name
  end
end

def team_names
names = []
game_hash.each do |side, data|
  names << data[:team_name]
end
names
end

def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |side, data|
   if data[:team_name] == team_name
  data.each do |k, v|
    if v.is_a?(Hash)
    v.each do |x,y|
    jersey_array << y[:number]
            end
          end
        end
      end
    end
  jersey_array
end

def player_stats(players_name)
  stat_hash = {}
  game_hash.each do |side, data|
    data.each do |k, v|
      if v.is_a?(Hash)
        v.each do |x, y|
      if x == players_name
        stat_hash = y
end
end
end
end
end
stat_hash
end



def big_shoe_rebounds
  big = []
  game_hash.each do |side, data|
  data.each do |k, v|
    if v.is_a?(Hash)
    v.each do |x,y|
      big<< y[:shoe]
      if y[:shoe] == big.max
        return y[:rebounds]

end
end
end
end
end
end
