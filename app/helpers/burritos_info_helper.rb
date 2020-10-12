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

  def sync(plat_a, plat_b, plat_c)
    merged = plat_c.merge(plat_b)
    merged['category_id2'] = merged['category_id']
    merged = merged.merge(plat_a)

    merged.without('street_address', 'address_line_1')
  end

  def format_hours_for_a(platform, hours)
    if platform.match?('a')
      new_hours = hours.gsub(/,/, '|')
      return new_hours.gsub(/ /, '-')
    end
    if platform.match?('b')
      days_of_week = %w[Mon Tue Wed Thu Fri Sat Sun]
      arr = []
      hours = hours.split(',')
      pp hours
      hours.each_with_index do |val, index|
        arr.push("#{days_of_week[index]}:#{val}")
      end

      new_hours = arr.join(',')
      new_hours = new_hours.gsub(/,/, '|')
      return new_hours.gsub(/ /, '-')
    end

    hours.gsub(/ /, '-') if platform.match?('c')
  end

  def format_for_platform(name, params)
    case name
    when 'a'
      params[:address] = "#{params[:address]} #{params[:address2_line_2]}"
      params
    when 'b'
      params[:street_address] = "#{params[:address]} #{params[:address2_line_2]}"
      params[:category_id] = params.delete :category_id2
      params
    when 'c'
      params[:address_line_1] = params[:address]
      params
    else
      pp 'Error Occured'
    end
  end

  def checkresponse(response)
    if response.to_i.equal?(200)
      1
    else
      0
    end
  end

  def add_to_queue(params)
    Stack.create!(params)
  end

  def stack
    params = Stack.first.to_json

    if Stack.count >= 1
      platforms = %w[a b c]
      flag = 1
      platforms.each do |x|
        flag = 0 if @api_service.update(x, JSON.parse(params)).equal?(1)
      end
    end
    Stack.delete_all if flag.equal?(1)
  end
end
