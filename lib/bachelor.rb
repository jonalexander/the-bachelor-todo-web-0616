require 'Pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    return contestant["name"].split(' ').delete_at(0) if contestant["status"] == "Winner"
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      return contestant_info["name"] if contestant_info["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      counter += 1 if contestant_info["hometown"] == hometown
    end
  end

  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestant_array|
    contestant_array.each do |contestant_info|
      return contestant_info["occupation"] if contestant_info["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  counter = data[season].length
  sum = (data[season].collect { |contestants| contestants["age"].to_f }.inject { |sum, x| sum + x })
  (sum / counter).round
end
