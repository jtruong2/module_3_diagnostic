class NrelService
  def initialize(zipcode)
    @zipcode = zipcode[:q]
    @conn = Faraday::Connection.new("https://api.data.gov/nrel/alt-fuel-stations/v1") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.search_by_zipcode(zipcode)
    new(zipcode).search_by_zipcode
  end

  def search_by_zipcode
    response = @conn.get("/nearest.json?location=#{@zipcode}&radius=6")
    JSON.parse(response.body, symbolize_names: true)
  end
end
