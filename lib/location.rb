class Location
  NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/

  def initialize(location)
    @location = location
  end

  def humanized
    HumanLocation.normalize(@location)
  end

  def distance
    Distance.weight(humanized)
  end

  def near_office?
    @location =~ NEAR_OFFICE
  end
end
