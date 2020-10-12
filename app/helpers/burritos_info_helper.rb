module BurritosInfoHelper
  def filter(response)
    validation_field = %w[name
                          address
                          street_address
                          adress_line_2
                          lat
                          lng
                          category_id
                          closed
                          hours
                          phone_number
                          website
                          address_line_1]
    response.select { |k, _v| validation_field.any?(k) }
  end

  def sync(a, b, c)
    merged = c.merge(b)
    merged['category_id2'] = merged['category_id']
    merged = merged.merge(a)

    merged.without('street_address', 'address_line_1')
  end

  def formatHoursForA(platform, hours)
    if platform === 'a'
      newHours = hours.gsub(/,/, '|')
      return newHours.gsub(/ /, '-')
    end
    if platform === 'b'
      daysofWeek = %w[Mon Tue Wed Thu Fri Sat Sun]
      arr = []
      hours = hours.split(',')
      pp hours
      hours.each_with_index do |val, index|
        arr.push("#{daysofWeek[index]}:#{val}")
      end

      newHours = arr.join(',')
      newHours = newHours.gsub(/,/, '|')
      return newHours.gsub(/ /, '-')
    end

    hours.gsub(/ /, '-') if platform === 'c'
  end

  def formatForPlatform(name, params)
    if name === 'a'
      params[:address] = "#{params[:address]} #{params[:address2_line_2]}"
      return params
    end
    if name === 'b'
      params[:street_address] = "#{params[:address]} #{params[:address2_line_2]}"
      params[:category_id] = params.delete :category_id2
      return params
    end

    if name === 'c'
      params[:address_line_1] = params[:address]
      params
    end
  end

  def checkresponse(response)
    if 200 === response.to_i
      1
    else
      0
    end
  end

  def addToQueue(params)
    Stack.create!(params)
  end

  def stack
    stack = Stack.all
    size = Stack.count
    params=Stack.first.to_json
    

    if size >= 1
      platforms = %w[a b c]
      flag=1
      platforms.each do |x|
        flag=0 if @api_service.update(x, JSON.parse(params))===1
      end
    end
    Stack.delete_all if flag === 1
  end
end
