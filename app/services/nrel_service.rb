class NrelService

  def initialize(key)
    @key = key
    @_conn = Faraday.get 'https://api.data.gov/nrel/alt-fuel-stations/v1/'
  end

  def find_stations(location)
    parser(conn.get "/nearest.json?location=#{location}")
  end


  private

  def conn
    @_conn
  end

  def parser
    JSON.parse(response.body, symbolize_names: true)
  end

end