require 'minitest/autorun'
# NOTE: rbs setup hooks the :end event via TracePoint so you MUST require setup before loading any code which needs to be checked
require 'rbs/test/setup'
require_relative '../lib/chat_app'

class TestChatApp < Minitest::Test

  def test_user_new
    user = ChatApp::User.new "pete", "pete@timelight.com"
    assert !user.login.nil?
    assert !user.email.nil?
  end

  def test_user_new_throws
    assert_raises(RBS::Test::Tester::TypeError) do
      ChatApp::User.new 1,2
    end
  end

  def test_bot_new_no_keywords
    # minitest assert_throws doesn't catch custom exceptions
    begin
      owner = ChatApp::User.new "pete", "pete@timelight.com"
      bot = ChatApp::Bot.new "Fred", owner
      assert false
    rescue  RBS::Test::Tester::TypeError
      assert true
    end
  end

  def test_bot_new_keywords
    owner = ChatApp::User.new "pete", "pete@timelight.com"
    bot = ChatApp::Bot.new name: "Fred", owner: owner
    assert !bot.name.nil?
  end

  def test_invalid_string
    assert_raises(ArgumentError) {
      ChatApp::StringWithLimit.new "0123456789123456789"
    }
  end

  def test_message_new_valid
    user = ChatApp::User.new 'pete', 'pete@timelight.com'
    valid_string = ChatApp::StringWithLimit.new "0123456789"
    message = ChatApp::Message.new user, valid_string
    assert message.string.length > 0
  end
end
