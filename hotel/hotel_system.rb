require 'hotel'
require 'reservinfo'
require 'input_parser'

class HotelSystem
  attr_accessor :hotels_list

  def initialize(hotels)
    @hotels_list = []
    hotels.each_pair do |name, config|
      @hotels_list << Hotel.new(name, config["rating"], config["regular_price_info"], config["reward_price_info"])
    end
  end


  def find_cheapest_hotel(revers_info)
    if revers_info.valid?
      @hotels_list.sort! { |a, b| a.compute_price(revers_info) <=> b.compute_price(revers_info) }.first.name
    else
      "%s is invalid format" % live_str
    end
  end
end