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
end
