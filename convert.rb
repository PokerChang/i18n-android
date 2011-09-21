require 'rexml/document'
banner = 'Usage: ruby convert.rb android_strings_xml_path rails_yml_path'

if ARGV.count < 2
  puts banner
  exit
end
file   = File.open(ARGV[1], "a")

xml = File.read(ARGV[0])
doc= REXML::Document.new(xml)

# order alphabetically
result = []
doc.elements.each('/resources/string') do |p|
  result << ('  ' + p.attributes['name']+': "'+ p.text + '"')
end
result = result.sort{|a, b| a.downcase <=> b.downcase}

result.each do |r|
  file.puts r
end