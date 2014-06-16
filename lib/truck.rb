class Truck
  NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/

  def initialize(xml_element)
    @element = xml_element
  end

  def available?
    day_is_today? && available_for_lunch? && near_office?
  end

  def pretty_information(justification)
    "%-#{justification}s @ #{humanized_location}" % name
  end

  def name
    css('.com a').text
  end

  def humanized_location
    location.humanized
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
    Time.now.strftime("%A")
  end
end
