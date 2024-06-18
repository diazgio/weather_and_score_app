class HomeController < ApplicationController
  def index
  end

  def weather
    @weather_data = parse_weather_data(Rails.root.join('app/assets/data/w_data.dat'))
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

  
end
