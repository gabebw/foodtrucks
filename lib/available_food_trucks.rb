class AvailableFoodTrucks
  def self.all_for(city)
    new(city).all
  end

  def initialize(city)
    @city = city
    @doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
  end

  def all
    if @city == "boston"
      sources = truck_elements.map { |element| BostonTruckDataSource.new(element) }
    end
    trucks = sources.map { |source| FoodTruck.new(source) }

    trucks.select(&:available?)
  end

  private

  def truck_elements
    @doc.css('.trFoodTrucks')
  end
end

