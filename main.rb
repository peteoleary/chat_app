# NOTE: rbs setup hooks the :end event via TracePoint so you MUST require setup before loading any code which needs to be checked
require 'rbs/test/setup'
require_relative './lib/chat_app'

begin
  user = ChatApp::User.new 'pete', 'pete@timelight.com'
end
