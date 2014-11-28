class FoodTruck
  def initialize(source, user_location)
    @source = source
    @user_location = user_location
  end

  def available?
    day_is_today? && available_for_lunch? && near_user?
  end

  def data
    @source.data[name] || {}
  end

  def name
    @source.name
  end

  def humanized_location
    location.humanized
  end

  def distance_and_location
    [location.distance_from_user, location.humanized]
  end

  private

  def location
    @location ||= Location.new(@source.location, @user_location)
  end

  def day_is_today?
    @source.day_available == day_of_week
  end

  def available_for_lunch?
    @source.meal == 'Lunch'
  end

  def near_user?
    location.distance_from_user < 10
  end

  def day_of_week
    now.strftime("%A")
  end

  def now
    Time.now.in_time_zone(@source.time_zone)
  end
end
