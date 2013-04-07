require 'open-uri'
require 'fileutils'

url = 'http://~~~'
usage unless url

filename = url.split(/\//).last

open(url) do |source|
  open(filename, "w+b") do |o|
    o.print source.read
  end
end

FileUtils.move(filename, '/usr/bin/jsget',{:force => true})
FileUtils.chmod(0755, '/usr/gin/jsget')
