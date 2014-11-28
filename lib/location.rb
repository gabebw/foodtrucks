class Location
  def initialize(ugly_truck_location, user_location)
    @ugly_truck_location = ugly_truck_location
    @user_location = user_location
  end

  def humanized
    HumanLocation.normalize(@ugly_truck_location)
  end

  def distance_from_user
    p humanized
    truck_location = GEOCODER.geocode(humanized)
    @user_location.distance_to(truck_location)
  end
end
