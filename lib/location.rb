class Location
  NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/

  def initialize(ugly_truck_location)
    @ugly_truck_location = ugly_truck_location
  end

  def humanized
    HumanLocation.normalize(@ugly_truck_location)
  end

  def distance
    Distance.weight(humanized)
  end

  def near_office?
    @ugly_truck_location =~ NEAR_OFFICE
  end
end
