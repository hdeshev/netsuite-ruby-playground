require 'pp'
require 'date'
require_relative './config'

invoice = NetSuite::Records::Invoice.get(2520)
pp invoice.status

new_payment = NetSuite::Records::CustomerPayment.initialize(invoice)
new_payment.account = NetSuite::Records::RecordRef.new(internal_id: 217)
new_payment.payment_method = NetSuite::Records::RecordRef.new(internal_id: 7)
#pp new_payment

# work around a stupid crash here:
# <platformCore:code>INSUFFICIENT_PERMISSION</platformCore:code>
# <platformCore:message>You do not have permissions to set a value for element exchangerate due to one of the following reasons: 1) The field is read-only; 2) An associated feature is disabled; 3) The field is available either when a record is created or updated, but not in both cases.</platformCore:message>
new_payment.exchange_rate = nil

pp new_payment.add
