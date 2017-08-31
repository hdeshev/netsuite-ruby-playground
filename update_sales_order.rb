require 'pp'
require 'date'
require_relative './config'

customer = NetSuite::Records::Customer.get 3
puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"

sales_order = NetSuite::Records::SalesOrder.get(303)
#pp sales_order

#netsuite_invoice.custom_form
puts "Existing order: #{sales_order.internal_id} #{sales_order.external_id}"

new_items = NetSuite::Records::SalesOrderItemList.new
new_item = NetSuite::Records::SalesOrderItem.new(
  item: {
    name: 'Fixed Fee',
    internal_id: 6,
  },
  quantity: "1.0",
  amount: "30.0",
)
new_items.items << new_item

result = sales_order.update(item_list: new_items)
#result = sales_order.update(item_list: new_items, order_status: '_pendingFulfillment')
pp result
