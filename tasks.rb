require_relative './config'
require 'date'

task = NetSuite::Records::Task.new(
	:title => 'create task from API',
	:due_date => DateTime.now + 1,
	:message => "Take care of this"
)

task.add

puts task.internal_id
puts task.external_id
puts task.title
