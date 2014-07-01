class Location
  NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/

  def initialize(ugly_location)
    @ugly_location = ugly_location
  end

  def ugly
    HumanLocation.clean(@ugly_location)
  end

  def humanized
    HumanLocation.normalize(@ugly_location)
  end

  def distance
    Distance.weight(humanized)
  end

  def near_office?
    @ugly_location =~ NEAR_OFFICE
  end
end
