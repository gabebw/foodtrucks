class BostonTruckDataSource
  BOSTON_TRUCK_DATA = YAML.load(open(File.join(DATA_DIRECTORY, "boston.yml")))
  TIME_ZONE = "Eastern Time (US & Canada)"

  def initialize(element)
    @element = element
  end

  def name
    css('.com a').text.sub(/ *\d$/, '')
  end

  def meal
    css('.tod').text
  end

  def day_available
    css('.dow').text
  end

  def location
    css('.loc').text
  end

  def data
    BOSTON_TRUCK_DATA
  end

  def time_zone
    TIME_ZONE
  end

  private

  def css(selector)
    @element.css(selector)
  end
end

