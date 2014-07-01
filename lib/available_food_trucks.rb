class AvailableFoodTrucks
  def self.all_for(city)
    new(city).all
  end

  def initialize(city)
    @city = city
  end

  def all
    if @city == "boston"
      sources = boston_truck_elements.map { |element| BostonTruckDataSource.new(element) }
    end
    trucks = sources.map { |source| FoodTruck.new(source) }

    trucks.select(&:available?)
  end

  private

  def boston_truck_elements
    doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
    doc.css('.trFoodTrucks')
  end
end

