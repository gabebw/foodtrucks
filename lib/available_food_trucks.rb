class AvailableFoodTrucks
  def initialize
    @doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
  end

  def self.all
    new.all
  end

  def all
    truck_elements.map { |element| FoodTruck.new(element) }.select(&:available?)
  end

  private

  def truck_elements
    @doc.css('.trFoodTrucks')
  end
end

