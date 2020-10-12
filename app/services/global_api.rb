class GlobalApi
  include HTTParty
  include BurritosInfoHelper

  def initialize
    @options = {}
  end

  def platform(name)
    api = Rails.application.credentials.api[:api_key]
    url = "#{Rails.application.credentials.api[:base_uri]}#{name}/venue?api_key=#{api}"
    response = HTTParty.get(url, @options)
    filter(response)
  end

  
end
