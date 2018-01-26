class NobelPrizeTeller
  attr_reader :status

  def initialize
    @status = nil
  end

  def download
    conn = Faraday.new url: "http://api.nobelprize.org/v1"
    @response = conn.get "/prize.json"
    @status = "processed"
  end

  def data
    JSON.parse(@response.body)
  end
end