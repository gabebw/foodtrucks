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
      available_trucks.sort_by(&:location).map { |truck| truck.pretty_information(longest_truck_name_length) }.join("\n")
    end
  end

  private

  def all_available
    @doc.css('.trFoodTrucks').map do |element|
      Truck.new(element)
    end.select(&:available?)
  end

  class Truck
    NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/

    def initialize(xml_element)
      @element = xml_element
    end

    def available?
      day_is_today? && available_for_lunch? && is_near_office?
    end

    def pretty_information(justification)
      "%-#{justification}s @ #{location}" % name
    end

    def name
      css('.com a').text
    end

    def location
      css('.loc').text.split(';').last.sub(/^\(\d+\) /, '')
    end

    private

    def day_is_today?
      css('.dow').text == day_of_week
    end

    def available_for_lunch?
      css('.tod').text == 'Lunch'
    end

    def is_near_office?
      css('.loc').text =~ NEAR_OFFICE
    end

    def css(selector)
      @element.css(selector)
    end

    def day_of_week
      Time.now.strftime("%A")
    end
  end
end
