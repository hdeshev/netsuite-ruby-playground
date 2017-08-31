require 'pp'
require_relative './config'

def get_customer(id)
  NetSuite::Records::Customer.get id
end

customer = get_customer 3
puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"

#customer.external_id = '6102679841'
#customer.update
