require 'pp'
require 'date'
require_relative './config'

#customer = NetSuite::Records::Customer.get 3
#puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"

#sales_order = NetSuite::Records::SalesOrder.get(403)
#pp sales_order
#puts "Status: #{sales_order.status}"
#puts "Status: #{sales_order.order_status}"

#exit

#puts "Existing order: #{sales_order.internal_id} #{sales_order.external_id}"
#item = sales_order.item_list.item[0]
#pp item

# NetSuite dates are tricky:
# http://mikebian.co/notes-on-dates-timezones-with-netsuites-suitetalk-api/

new_order = NetSuite::Records::SalesOrder.new(
  start_date: NetSuite::Utilities.normalize_time_to_netsuite_date(DateTime.parse('2017-08-01').to_time),
  end_date: NetSuite::Utilities.normalize_time_to_netsuite_date(DateTime.parse('2017-08-31').to_time),
  entity: {internal_id: 3},
  order_status: '_pendingFulfillment',
  #order_status: '_pendingApproval',
)

new_item = NetSuite::Records::SalesOrderItem.new(
  item: {
    name: 'Fixed Fee',
    internal_id: 6,
  },
  quantity: "1.0",
  amount: "10.0",
)

new_order.item_list.items << new_item
response = new_order.add
pp response


=begin
Order
=====
created_date
entity (customer ref)
currency (ref)
tran_date - transaction date
start_date
end_date
sales_effective_date
ship_date
transaction_ship_address (ref)
ship_address_list (ref)
order_status: _pendingApproval, _pendingFulfillment, _fullyBilled

Item
====
quantity
quantity_fulfilled
price (ref)
amount "100.0"
tax1_amt
tax_code
=end
