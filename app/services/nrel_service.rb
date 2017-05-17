class NrelService

  def initialize(key)
    @key = key
    @_conn = Faraday.new("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json")
  end

  def find_stations(location)
    parser(conn.get "?location=#{location}&radius=6.0&fuel_type=ELEC,LPG&limit=10&api_key=#{@key}")[:fuel_stations]
  end


  private

  def conn
    @_conn
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end