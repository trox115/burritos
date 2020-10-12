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

  def formatHoursForA(platform,hours)
    if platform==='a'
         newHours= hours.gsub(/,/, '|')
         return newHours.gsub(/ /,'-')
    end
    if platform === 'b'
        daysofWeek=['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
        arr= []
        hours = hours.split(",")
        pp hours
       hours.each_with_index do |val,index| 
        
        arr.push("#{daysofWeek[index]}:#{val}")
       end

       newHours= arr.join(',')
       newHours= newHours.gsub(/,/, '|')
       return newHours.gsub(/ /,'-')
    end

    if platform==='c'
        return hours.gsub(/ /,'-')
    end
end
def formatForPlatform(name,params)
  if name==='a'
      params[:address] = "#{params[:address]} #{params[:adress2]}"
      return params
  end
  if name==='b'
      params[:street_address] = "#{params[:address]} #{params[:adress2]}"
      params[:category_id] = params.delete :category_id2
      return params
  end

  if name==='c'
      params[:address_line_1] = params[:address]
      params[:address_line_2] = params[:adress2]
      return params
  end
end
end
