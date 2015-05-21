class FoodTruck
  def initialize(source)
    @source = source
  end

  def available?
    day_is_today? && available_for_lunch? && near_office?
  end

  def name
    @source.name
  end

  def pretty_location
    location.prettified
  end

  def distance_and_location
    [location.distance, location.prettified]
  end

  def menu
    data[:menu]
  end

  def twitter_link
    if data[:twitter]
      "https://twitter.com/#{data[:twitter]}"
    end
  end

  def facebook_link
    if data[:facebook]
      "https://www.facebook.com/#{data[:facebook]}"
    end
  end

  private

  def data
    @source.data
  end

  def location
    @location ||= Location.new(@source.location)
  end

  def day_is_today?
    @source.day_available == day_of_week
  end

  def available_for_lunch?
    @source.meal == 'Lunch'
  end

  def near_office?
    location.near_office?
  end

  def day_of_week
    now.strftime("%A")
  end

  def now
    Time.now.in_time_zone(@source.time_zone)
  end
end
