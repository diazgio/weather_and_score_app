class HomeController < ApplicationController
  def index
  end

  def weather
    @weather_data = parse_weather_data(Rails.root.join('app/assets/data/w_data.dat'))
    raw_data = File.read(Rails.root.join('app/assets/data/w_data.dat'))
    raw_data.gsub!('<pre>', '')
    raw_data.gsub!('</pre>', '')
    @all_data = raw_data.split("\n").map { |line| line.split }
  end

  def score
    @score_data = parse_score_data('app/assets/data/soccer.dat')
    raw_data = File.read(Rails.root.join('app/assets/data/soccer.dat'))
    raw_data.gsub!('<pre>', '')
    raw_data.gsub!('</pre>', '')
    @all_data = raw_data.split("\n").map { |line| line.split }
  end
  
  private

  def parse_weather_data(file_path)
    data = File.read(file_path).split("\n").reject { |line| line.strip.empty? || !line.match(/^\s*\d/) } # Skip empty lines and lines that don't start with a number
    weather_data = data.map do |line|
      columns = line.split
      next if columns[1].nil? || columns[2].nil? # Ignore lines that don't have the expected format
      day = columns[0].to_i
      max_temp = columns[1].to_f
      min_temp = columns[2].to_f
      { day: day, spread: (max_temp - min_temp).abs }
    end
    weather_data.compact.min_by { |day_data| day_data[:spread] } # Use compact to remove nil values and return the day with the smallest temperature spread
  end

  def parse_score_data(file_path)
    data = File.read(file_path).split("\n").reject { |line| line.strip.empty? || !line.match(/^\s*\d/) } # Skip empty lines and lines that don't start with a number
    soccer_data = data.map do |line|
      columns = line.split(/\s{2,}/) # Split the line by two or more spaces
      next if columns[1].nil? || columns[6].nil? || columns[8].nil? # Ignore lines that don't have the expected format
      team = columns[1].gsub(/^\d+\.\s/, '') # Remove the ranking number from the team name
      goals_for = columns[6].split('-')[0].to_i # Extract the goals scored
      goals_against = columns[6].split('-')[1].to_i # Extract the goals conceded
      { team: team, difference: (goals_for - goals_against).abs }
    end
    soccer_data.compact.min_by { |team_data| team_data[:difference] } # Use compact to remove nil values and return the team with the smallest goal difference
  end
end
