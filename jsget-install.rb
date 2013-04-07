require 'open-uri'
require 'fileutils'

url = 'https://raw.github.com/atmarksharp/jsget/master/jsget'
usage unless url

filename = url.split(/\//).last

open(url) do |source|
  open(filename, "w+b") do |o|
    o.print source.read
  end
end
puts
puts "download 'https://raw.github.com/atmarksharp/jsget/master/jsget'"

FileUtils.move(filename, '/usr/bin/jsget',{:force => true})
puts "installing '/usr/bin/jsget'"
FileUtils.chmod(0755, '/usr/bin/jsget', {:verbose => true})
puts "install successed."
puts
