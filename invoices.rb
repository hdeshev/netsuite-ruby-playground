require 'pp'
require_relative './config'

# def get_invoices(*args)
#   NetSuite::Records::Invoice.get_list(list: args)
# end

def get_customers(*args)
  NetSuite::Records::Customer.get_list(list: args)
end

customer = get_customers(127)[0]
puts "#{customer.internal_id},#{customer.external_id},#{customer.email}"

# puts NetSuite::Records::Invoice.fields

netsuite_invoice = NetSuite::Records::Invoice.get(22473)
#netsuite_invoice.custom_form
puts "Existing invoice: #{netsuite_invoice.internal_id} #{netsuite_invoice.external_id}"
invoice_item = netsuite_invoice.item_list.item[0]
pp invoice_item

invoice = NetSuite::Records::Invoice.new(
  tran_id: 'RB20170630123456790USD',
  due_date: DateTime.now + 1,
  amount: 10,
  exchange_rate: 1,
  currency: NetSuite::Records::Currency.get(1),
  entity: NetSuite::Records::RecordRef.new(internal_id: 324),
  order_type: 'Sales Order',
  # account: netsuite_invoice.account,
  # bill_address_list: netsuite_invoice.bill_address_list,
  # custom_form: netsuite_invoice.custom_form,
  # department: netsuite_invoice.department,
  # entity: netsuite_invoice.entity,
  # partner: netsuite_invoice.partner,
  # posting_period: netsuite_invoice.posting_period,
  # ship_address_list: netsuite_invoice.ship_address_list,
  # terms: netsuite_invoice.terms,
  # location: netsuite_invoice.location,
  # sales_rep: netsuite_invoice.sales_rep,
  # tax_item: netsuite_invoice.tax_item,
  # created_from: netsuite_invoice.created_from,
  # ship_method: netsuite_invoice.ship_method,
  # lead_source: netsuite_invoice.lead_source,
  # promo_code: netsuite_invoice.promo_code,
  # subsidiary: netsuite_invoice.subsidiary,
  # currency: netsuite_invoice.currency,
  # approval_status: netsuite_invoice.approval_status,
  # job: netsuite_invoice.job,
  # entity: entity,
  # currency: currency,
  # account: account,
  # location: location,
  # custom_form: netsuite_invoice.custom_form,
  # posting_period: netsuite_invoice.posting_period,
  # item_list: netsuite_invoice.item_list,
)
invoice.custom_field_list.custbody_order_type = 1
invoice.custom_field_list.custbody_end_user = 324
#pp invoice.item_list

invoice_item = NetSuite::Records::InvoiceItem.new(
  attributes: {
    name: "RB Extract",
  },
  description: "RB Extract description",
  amount: "20.0",
  quantity: 5,
)

invoice.item_list.items << invoice_item
puts invoice.add
