class Station

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def self.stations(key, location)

    NrelService.new(key).find_stations(location).map do |data|
      new(data)
    end
  end

  def station_name
    attrs[:station_name]
  end

  def address
    "#{attrs[:street_address]} #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
  end

  def fuel_type
    attrs[:fuel_type_code]
  end

  def distance
    attrs[:distance].round(2)
  end

  def acces_times
    attrs[:access_days_time]
  end
end