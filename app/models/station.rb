class Station

  def self.search_by_zipcode(zipcode)
    NrelService.search_by_zip(zipcode)
  end
end
