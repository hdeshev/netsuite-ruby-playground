require 'pp'
require_relative './config'

def get_customer(id)
  NetSuite::Records::Customer.get id
end


def update_customer(id)
  customer = get_customer id
  customer.external_id = '6102679841'
  customer.update
end

def create_customer()
  new_customer = NetSuite::Records::Customer.new(
    account_number: '6422657874',
    company_name: 'Example Dot Com',
    email: 'mycustomer@example.com',
    phone: '+44 12345678',
    is_person: false,
    subsidiary: {internal_id: 3, name: 'USA'},
    vat_reg_number: '1234567890',
  )
  new_customer.add
  new_customer
end

def change_subsidiary(id, new_subsidiary)
  customer = get_customer id
  puts "Current subsidiary: #{customer.subsidiary.internal_id}"
  customer.update(subsidiary: {internal_id: new_subsidiary})
  customer
end

#customer = get_customer 111
#puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"

#new_customer = create_customer
#puts "ID: #{new_customer.internal_id} #{new_customer.errors}"

customer = change_subsidiary 511, 3
puts "#{customer.subsidiary.internal_id}, #{customer.errors}"
