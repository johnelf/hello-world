require 'yaml'
require './hotel_system'

hotels = YAML.load_file "hotels.yml"
hotel_sys = HotelSystem.new(hotels)

File.open("./input_list", "r") do |file|
  while line = file.gets
    puts hotel_sys.find_cheapest_hotel(line.strip)
  end
end