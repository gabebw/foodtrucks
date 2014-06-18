class PrettyPrinter
  LINE_PREFIX = "\n&#9493; "

  def initialize(trucks)
    @trucks = trucks
  end

  def print
    all_trucks_pretty_printed.join("\n")
  end

  private

  def all_trucks_pretty_printed
    hash = Hash.new { |h, k| h[k] = [] }
    @trucks.each { |truck| hash[truck.humanized_location] << truck }
    hash.map do |location, trucks|
      pretty_trucks = trucks.map(&:name_with_url).join(LINE_PREFIX)
      "\n<b>#{location}</b>#{LINE_PREFIX}#{pretty_trucks}"
    end
  end

  def pretty_information(truck)
    difference = justification - truck.name.size
    spacing = '&nbsp;' * difference
    "#{truck.name_with_url}#{spacing} @ #{truck.humanized_location}"
  end

  def longest_truck_name_length
    @trucks.max_by { |truck| truck.name.size }.name.size
  end

  alias justification longest_truck_name_length
end
