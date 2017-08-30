class NrelService
  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.get()
  end

  def self.search_by_zipcode(zipcode)
    new(zipcode).search_by_zipcode
  end

  def search_by_zipcode

  end
end
