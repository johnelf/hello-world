class ReservInfo
  attr_accessor :customer_type, :live_time_list

  def initialize(customer_type, live_time_list)
    self.customer_type = customer_type
    self.live_time_list = live_time_list
  end

  def valid?
    !customer_type.nil? && live_time_list.size == 3
  end

  def show
    puts "%s:%s" % [@customer_type, @live_time_list.to_s]
  end

end