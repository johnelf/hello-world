class InputParser

  def self.extract_live_time(live_str)
    result = live_str.scan(/^(Regular|Rewards): \S+\((\w+)\), \S+\((\w+)\), \S+\((\w+)\)$/).flatten
    ReservInfo.new(result.shift.downcase, result)
  end

end