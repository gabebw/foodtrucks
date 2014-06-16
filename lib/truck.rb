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
    HumanLocation.normalize(less_human_location)
  end

  private

  def less_human_location
    css('.loc').text.split(';').last.sub(/^\(\d+\) /, '')
  end

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
