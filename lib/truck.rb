class Truck
  NEAR_OFFICE = /Financial|(South Station)|Greenway|(City Hall)|(Dewey Square)|(Boston Common)|Chinatown/
  MENU_URLS = {
    "Bon Me" => "http://www.bonmetruck.com/menu/",
    "Evan's NY Style Deli" => "http://www.evansnewyorkstyledeli.com/our-food-truck/food-truck-menu/",
    "Mei Mei Street Kitchen" => "http://meimeiboston.tumblr.com/",
  }

  def initialize(xml_element)
    @element = xml_element
  end

  def available?
    day_is_today? && available_for_lunch? && near_office?
  end

  def pretty_information(justification)
    difference = justification - name.size
    spacing = '&nbsp;' * difference
    "%s#{spacing} @ #{humanized_location}" % name_with_url
  end

  def name_with_url
    if MENU_URLS.key?(name)
      %{<a href="#{MENU_URLS[name]}">#{name}</a>}
    else
      name
    end
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
