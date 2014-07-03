class ReservInfo
  attr_accessor :customer_type, :live_time_list

  def initialize
    @customer_type=nil
    @live_time_list=nil
  end

  def show
    puts "%s:%s" % [@customer_type, @live_time_list.to_s]
  end

  def extract_live_time(live_str)
    result = live_str.scan(/^(Regular|Rewards): \S+\((\w+)\), \S+\((\w+)\), \S+\((\w+)\)$/).flatten
    @customer_type = result.shift.downcase
    @live_time_list = result
    result.size < 4
  end

end