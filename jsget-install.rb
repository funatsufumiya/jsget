require 'open-uri'
require 'fileutils'

@red = "\e\[00;31m"
@green = "\e\[00;32m"
@clear = "\e\[00;0m"

def console(s)
  puts "#{@green}=====> #{@clear}" + s
end

url = 'https://raw.github.com/atmarksharp/jsget/master/jsget'

filename = url.split(/\//).last

open(url) do |source|
  open(filename, "w+b") do |o|
    o.print source.read
  end
end
puts
console("download 'https://raw.github.com/atmarksharp/jsget/master/jsget'")
FileUtils.move(filename, '/usr/bin/jsget',{:force => true})
console("installing '/usr/bin/jsget'")
FileUtils.chmod(0755, '/usr/bin/jsget', {:verbose => true})
FileUtils.mkdir_p("#{ENV["HOME"]}/.jsget/")
FileUtils.chmod(0775, "#{ENV["HOME"]}/.jsget/", {:verbose => true})
console("createing folder '~/.jsget'")
console("install successed :)")
puts
