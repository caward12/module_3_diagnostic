class Station

  def initialize(attrs={})
    @attrs = attrs
  end

  def self.stations(key, location)
    NrelService.new(key).find_stations(location).each do |data|
      new(data)
    end
  end
end