class PrettyPrinter
  def initialize(trucks)
    @trucks = trucks
  end

  def print
    all_trucks_pretty_printed.join("\n")
  end

  private

  def all_trucks_pretty_printed
    @trucks.sort_by(&:humanized_location).map do |truck|
      pretty_information(truck)
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
