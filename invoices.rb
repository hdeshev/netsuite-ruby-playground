require 'pp'
require_relative './config'

# def get_invoices(*args)
#   NetSuite::Records::Invoice.get_list(list: args)
# end


# puts NetSuite::Records::Invoice.fields

netsuite_invoice = NetSuite::Records::Invoice.get(22473)
netsuite_invoice.custom_form
# puts netsuite_invoice.location.internal_id

invoice = NetSuite::Records::Invoice.new(
  tran_id: 'RB20170630123456789USD',
  due_date: DateTime.now + 1,
  amount: 10,
  exchange_rate: 1,
  currency: NetSuite::Records::Currency.get(1),
  entity: NetSuite::Records::RecordRef.new(internal_id: 324),
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
puts invoice.add
