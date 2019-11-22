require "nokogiri"

xml = File.read("anos.xsl")
doc = Nokogiri::HTML::DocumentFragment.parse(xml)

h2 = doc.at_css("h2")
h2.content = "ANOS KKKKKK"

puts doc

File.write("../html/anos.html", doc)

for value in enumerable do
    
end
