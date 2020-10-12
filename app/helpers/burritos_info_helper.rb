module BurritosInfoHelper
  def filter(response)
    validation_field = ['name',
                        'address',
                        'street_address',
                        'adress_line_2',
                        'lat',
                        'lng',
                        'category_id',
                        'closed',
                        'hours',
                        'phone_number',
                        'website',
                        'address_line_1']
    response.select { |k, _v| validation_field.any?(k) }
  end

  def sync(a,b,c)
    
    merged = c.merge(b)
    merged['category_id2'] = merged['category_id']
    merged = merged.merge(a)
    
   merged.without("street_address", "address_line_1") 
  end
end
