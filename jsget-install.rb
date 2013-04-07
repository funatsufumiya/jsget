require 'open-uri'
require 'fileutils'

@red = "\e\[00;31m"
@green = "\e\[00;32m"
@clear = "\e\[00;0m"
@yellow = "\e\[01;33m"
@lightgreen = "\e\[01;32m"
@lightblue = "\e\[00;36m"

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
console("#{@lightgreen}[download]#{@clear} 'https://raw.github.com/atmarksharp/jsget/master/jsget'")
FileUtils.move(filename, '/usr/bin/jsget',{:force => true})
console("#{@lightblue}[install]#{@clear} '/usr/bin/jsget'")
FileUtils.chmod(0755, '/usr/bin/jsget', {:verbose => true})
console("#{@lightblue}[create directory]#{@clear} '~/.jsget'")
FileUtils.mkdir_p("#{ENV["HOME"]}/.jsget/")
FileUtils.chmod(0775, "#{ENV["HOME"]}/.jsget/", {:verbose => true})
console("#{@yellow}install successed :)#{@clear}")
puts
