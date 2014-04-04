# This file is used by Rack-based servers to start the app.

require File.join(File.dirname(__FILE__), 'app.rb')

run App.new
