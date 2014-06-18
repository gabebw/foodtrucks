class FoodTruck
  NO_FOOD_TRUCKS = "No food trucks available for lunch today."

  def initialize
    @doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
  end

  def all
    if available_trucks.empty?
      NO_FOOD_TRUCKS
    else
      PrettyPrinter.new(available_trucks).print
    end
  end

  private

  def available_trucks
    @available_trucks ||= truck_elements.map { |element| Truck.new(element) }.select(&:available?)
  end

  def truck_elements
    @doc.css('.trFoodTrucks')
  end
end

