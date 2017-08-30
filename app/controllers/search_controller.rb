class SearchController < ApplicationController
  def index
    @results = Station.search_by_zipcode(safe_params)
  end

  private

  def safe_params
    params.permit(:q)
  end
end
