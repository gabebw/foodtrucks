class PrettyLocation
  MAP = {
    'Boston Common, Brewer Fountain by Tremont and Boylston Streets' => 'Boston Common',
    'Chinatown/Park Street, Boylston St near Washington St' => 'Chinatown Station (right on Washington until Boylston)',
    'City Hall Plaza, Fisher Park' => 'City Hall Plaza (walk up Tremont to Government Center Station)',
    'Financial District, Milk and Kilby Streets' => 'Milk & Kilby (left on Washington, right on Milk, go past the park)',
    'Rose Kennedy Greenway, Congress Street near Wharf' => 'Greenway, Congress St & Atlantic Avenue',
    'Rose Kennedy Greenway, Dewey Square, South Station' => 'South Station plaza (walk up Summer St towards DTX)',
  }

  def self.prettify(inhuman_location)
    location_without_document_write = inhuman_location.split(';').last
    cleaned = location_without_document_write.
      sub(/^\(\d+\) /, '').
      sub('Greenway,Congress', 'Greenway, Congress')

    MAP[cleaned] || cleaned
  end
end
