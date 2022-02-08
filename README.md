# Chat App RBS demo

# Introduction

This app takes the ChatApp module example from https://github.com/ruby/rbs and builds a simple app and minitest cases demonstrate using RBS.

# Setup and run

Requires Ruby 3.0.1 which you can install via http://rbenv.org/

```
git clone https://github.com/peteoleary/chat_app.git
cd chat_app
bundle install
RBS_TEST_TARGET=ChatApp::* bundle exec ruby main.rb
RBS_TEST_TARGET=ChatApp::* bundle exec ruby -Ilib:test test/test_chat_app.rb
```

# Notes

Ruby 3.0.1 tightens up the rules for positional v. keyword parameters https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/

RBS allows you to specify which to expect in the method signatures.
