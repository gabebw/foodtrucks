class FoodTruck
  NO_FOOD_TRUCKS = "No food trucks available for lunch today."

  def initialize
    @doc = Nokogiri::HTML(open('http://www.cityofboston.gov/business/mobile/schedule-app-min.asp'))
  end

  def all
    available_trucks = all_available
    if available_trucks.empty?
      NO_FOOD_TRUCKS
    else
      longest_truck_name_length = available_trucks.max_by { |truck| truck.name.size }.name.size
      available_trucks.sort_by(&:humanized_location).map { |truck| truck.pretty_information(longest_truck_name_length) }.join("\n")
    end
  end

  private

  def all_available
    @doc.css('.trFoodTrucks').map do |element|
      Truck.new(element)
    end.select(&:available?)
  end
end
