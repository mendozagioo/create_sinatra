require 'fileutils'

app = FileUtils.mkdir_p '../app'

app = File.new("../hello/hey.rb", "w")
app.puts "puts \"Hello Ruby\""
app.close
