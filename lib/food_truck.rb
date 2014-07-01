class FoodTruck
  TIME_ZONE = "Eastern Time (US & Canada)"
  BOSTON_TRUCK_DATA = YAML.load(open(File.join(DATA_DIRECTORY, "boston.yml")))

  def initialize(xml_element)
    @element = xml_element
  end

  def available?
    day_is_today? && available_for_lunch? && near_office?
  end

  def data
    BOSTON_TRUCK_DATA[name]
  end

  def name
    css('.com a').text.sub(/ *\d$/, '')
  end

  def humanized_location
    location.humanized
  end

  def distance_and_location
    [location.distance, location.humanized]
  end

  private

  def location
    @location ||= Location.new(less_human_location)
  end

  def less_human_location
    location_without_document_write = css('.loc').text.split(';').last
    location_without_document_write.sub(/^\(\d+\) /, '')
  end

  def day_is_today?
    css('.dow').text == day_of_week
  end

  def available_for_lunch?
    css('.tod').text == 'Lunch'
  end

  def near_office?
    location.near_office?
  end

  def css(selector)
    @element.css(selector)
  end

  def day_of_week
    now.strftime("%A")
  end

  private

  def now
    Time.now.in_time_zone(TIME_ZONE)
  end
end
