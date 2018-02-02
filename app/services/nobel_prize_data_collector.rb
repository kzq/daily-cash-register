# frozen_string_literal: true

class NobelPrizeDataCollector
  def collect
    body = fetch_data_from_api
    extract_data_from_api(body)
  end

  private

    def fetch_data_from_api
      conn = Faraday.new url: api_url
      conn.get.body
    rescue => e
      raise StandardError.new("could not fetch data")
    end

    def extract_data_from_api(body)
      body ? JSON.parse(body) : nil
    end

    def api_url
      "http://api.nobelprize.org/v1/prize.json"
    end
end
