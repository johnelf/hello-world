require './hotel'
require './reservinfo'

class HotelSystem
  attr_accessor :hotels_list

  def initialize(hotels)
    @hotels_list = []
    hotels.each_pair do |name, config|
      @hotels_list << Hotel.new(name, config["rating"], config["regular_price_info"], config["reward_price_info"])
    end
  end


  def find_cheapest_hotel(live_str)
    revers_info = ReservInfo.new
    if revers_info.extract_live_time(live_str)
      @hotels_list.sort! { |a, b| a.compute_price(revers_info)<=>b.compute_price(revers_info) }[0].name
    else
      "%s is invalid format" % live_str
    end
  end
end