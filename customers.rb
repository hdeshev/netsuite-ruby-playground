require 'pp'
require_relative './config'

def get_customers(*args)
  NetSuite::Records::Customer.get_list(list: args)
end

customers = get_customers *(127..150)

customers.each do |customer|
  puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"
end
