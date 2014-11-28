class HumanLocation
  MAP = {
    'Boston Common, Brewer Fountain by Tremont and Boylston Streets' => 'Boston Common',
    'Chinatown/Park Street, Boylston St near Washington St' => 'Chinatown Station, Boston MA',
    'City Hall Plaza, Fisher Park' => 'City Hall Plaza, Boston',
    'Financial District, Milk and Kilby Streets' => 'Milk St at Kilby St, Boston',
    'Rose Kennedy Greenway, Congress Street near Wharf' => 'Greenway, Congress St at Atlantic Avenue, Boston',
    'Rose Kennedy Greenway, Dewey Square, South Station' => 'South Station, Boston',
  }

  def self.normalize(inhuman_location)
    location_without_document_write = inhuman_location.split(';').last
    cleaned = location_without_document_write.
      sub(/^\(\d+\) /, '').
      sub('Greenway,Congress', 'Greenway, Congress')

    MAP[cleaned] || cleaned
  end
end
