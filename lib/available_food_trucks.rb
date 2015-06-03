class AvailableFoodTrucks
  def self.in(city)
    new(city)
  end

  def initialize(city)
    @city = city
  end

  def all
    trucks = sources.map { |source| FoodTruck.new(source) }
    trucks.select(&:available?)
  end

  def sorted
    all.sort_by(&:distance_and_location)
  end

  private

  def sources
    if @city == "boston"
      boston_data_sources
    end
  end

  def boston_data_sources
    boston_truck_elements.map { |element| BostonTruckDataSource.new(element) }
  end

  def boston_truck_elements
    doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
    doc.css('.trFoodTrucks')
  end
end
