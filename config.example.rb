require 'netsuite'

NetSuite.configure do
  reset!

  # optional, defaults to 2011_2
  api_version	'2012_1'

  # optionally specify full wsdl URL (to switch to sandbox, for example)
  wsdl          "https://webservices.sandbox.netsuite.com/wsdl/v#{api_version}_0/netsuite.wsdl"

  # if your datacenter is being switched, you'll have to manually set your wsdl location
  wsdl "https://webservices.na1.netsuite.com/wsdl/v#{api_version}_0/netsuite.wsdl"

  # or specify the sandbox flag if you don't want to deal with specifying a full URL
  #sandbox	true

  # often the netsuite servers will hang which would cause a timeout exception to be raised
  # if you don't mind waiting (e.g. processing NS via DJ), increasing the timeout should fix the issue
  read_timeout  100000

  # you can specify a file or file descriptor to send the log output to (defaults to STDOUT)
  log           'log/netsuite.log'

  # login information
  email '***'
  password '***'
  account '***'
  role  1111
end

