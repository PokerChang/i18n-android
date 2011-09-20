require 'rexml/document'
banner = 'Usage: ruby convert.rb android_strings_xml_path rails_yml_path'

if ARGV.count < 2
  puts banner
  exit
end
file   = File.open(ARGV[1], "a")

xml = File.read(ARGV[0])
doc= REXML::Document.new(xml)

doc.elements.each('/resources/string') do |p|
  file.puts '  ' + p.attributes['name']+': "'+ p.text + '"'
end

