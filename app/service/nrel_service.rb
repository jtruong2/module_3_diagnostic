class NrelService
  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=10")
  end

  def self.search_by_zipcode(zipcode)
    new(zipcode).search_by_zipcode
  end

  def search_by_zipcode
    response = @conn.get("/api/alt-fuel-stations/v1/nearest?location=#{zipcode}&radius=6")
  end
end
