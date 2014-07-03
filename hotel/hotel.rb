class Hotel
  attr_reader :name, :rating, :price_info

  def initialize(name, rating, regular_price_info, reward_price_info)
    @name = name
    @rating = rating
    @price_info = {}
    set_price_info(:regular_customer, regular_price_info[:weekday], regular_price_info[:weekend])
    set_price_info(:rewards_customer, reward_price_info[:weekday], reward_price_info[:weekend])
  end

  def get_week_type(str_date)
    (str_date == 'sun' || str_date == 'sat') ? :weekend : :weekday
  end

  def compute_price(reserv_info)
    reserv_info.live_time_list.inject(0) { |result, live_time| result + get_detail_price(reserv_info.customer_type, live_time) }
  end

  def get_detail_price(customer_type, live_time)
    @price_info[customer_type][get_week_type(live_time)]
  end

  private

  def set_price_info(customer_type, weekday_price, weekend_price)
    @price_info[customer_type] = {
        :weekday => weekday_price,
        :weekend => weekend_price
    }
  end

end

