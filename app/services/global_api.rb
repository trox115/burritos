class GlobalApi
  include HTTParty
  include BurritosInfoHelper

  def initialize
    @options = {}
  end

  def platform(name)
    url = "#{Rails.application.credentials.api[:base_uri]}#{name}/venue?api_key=#{Rails.application.credentials.api[:api_key]}"
    response = HTTParty.get(url, @options)
    filter(response)
  end
end
