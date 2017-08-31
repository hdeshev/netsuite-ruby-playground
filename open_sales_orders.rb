require 'pp'
require 'date'
require_relative './config'

# NetSuite dates are tricky:
# http://mikebian.co/notes-on-dates-timezones-with-netsuites-suitetalk-api/

search = NetSuite::Records::SalesOrder.search(
  saved: 19,
  basic: [
    {
      field: 'endDate',
      type: 'SearchDateField',
      operator: 'onOrBefore',
      value: [
        NetSuite::Utilities.normalize_time_to_netsuite_date(DateTime.parse('2017-08-31').to_time),
      ],
    },
  ],
  preferences: {
    body_fields_only: false,
    page_size: 5,
  },
)

search.results_in_batches do |batch|
  batch.each do |order|
    puts "#{order.internal_id} - #{order.tran_date}[#{order.start_date}-#{order.end_date}"
  end
  puts "---"
end
