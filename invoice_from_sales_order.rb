require 'pp'
require 'date'
require_relative './config'

#invoice = NetSuite::Records::Invoice.get(418)
#pp invoice.created_from

sales_order = NetSuite::Records::SalesOrder.get(1719)
#pp sales_order

new_invoice = NetSuite::Records::Invoice.initialize(sales_order)
#
# work around a stupid crash here:
# <platformCore:code>INSUFFICIENT_PERMISSION</platformCore:code>
# <platformCore:message>You do not have permissions to set a value for element exchangerate due to one of the following reasons: 1) The field is read-only; 2) An associated feature is disabled; 3) The field is available either when a record is created or updated, but not in both cases.</platformCore:message>
new_invoice.exchange_rate = nil

#pp new_invoice
pp new_invoice.add
