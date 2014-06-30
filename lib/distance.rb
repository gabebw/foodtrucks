class Distance
  # 0 to 5
  WEIGHT = {
    'Boston Common' => 0,
    'South Station plaza (walk up Summer St towards DTX)' => 2,
    'Milk & Kilby (left on Washington, right on Milk, go past the park)' => 2,
    'Chinatown Station (right on Washington until Boylston)' => 3,
    'City Hall Plaza (walk up Tremont to Government Center Station)' => 2,
    'Rose Kennedy Greenway, Milk Street by Aquarium' => 5,
  }

  DEFAULT_WEIGHT = 3

  def self.weight(humanized_location)
    WEIGHT.fetch(humanized_location, DEFAULT_WEIGHT)
  end
end
