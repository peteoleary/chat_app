# NOTE: rbs setup hooks the :end event via TracePoint so you MUST require setup before loading any code which needs to be checked
require 'rbs/test/setup'
require_relative './lib/chat_app'

channel = ChatApp::Channel.new 'developers'
user = ChatApp::User.new 'pete', 'pete@timelight.com'
message = ChatApp::Message.new user, ChatApp::StringWithLimit.new('First message')
channel.send_message message
channel.each_message.each do |m|
  print "from: #{m.from.login}, message: #{message.string}\n"
end
