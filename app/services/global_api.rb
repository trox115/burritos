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

  def update(name, platform_params)
    platform_params['hours'] = formatHoursForA(name, platform_params['hours'])
    new_params = formatForPlatform(name, platform_params)
    if ['a', 'b'].include?(name)
      platform_params['address'] = "#{platform_params['address']} #{platform_params['address_line_2']}"
    end
    @options = { "venue": new_params }
    api = Rails.application.credentials.api[:api_key]
    url = "#{Rails.application.credentials.api[:base_uri]}#{name}/venue?api_key=#{api}"
    response = HTTParty.patch(url, {
                                body: @options.to_json,
                                headers: { 'Content-Type' => 'application/json' }
                              })
    if 409.equal?response.code.to_i
      seconds_to_wait ||= (e.response[HTTP_RETRY_AFTER] || 2).to_i unless seconds_to_wait
      sleep seconds_to_wait
      response = HTTParty.patch(url, {
                                  body: @options.to_json,
                                  headers: { 'Content-Type' => 'application/json' }
                                })
    end
    pp name
    pp response
    response
  end
end
