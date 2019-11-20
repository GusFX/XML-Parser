require 'nokogiri'

#Validação DTD
xml = File.read("GioMovies.xml")
options = Nokogiri::XML::ParseOptions::DTDLOAD
doc = Nokogiri::XML::Document.parse(xml, nil, nil, options)
puts doc.external_subset.validate(doc) #Resposta vazia = XML válido



#Validação Schema
#xsd = Nokogiri::XML::Schema(File.read('GioMovies.xsd'))
#doc = Nokogiri::XML(File.read('GioMovies.xml'))
#puts xsd.validate(doc) #Resposta vazia = XML válido


xslt = Nokogiri::XSLT(File.read("transformer.xslt"))
transformede = xslt.transform(doc)

puts transformede


File.write("filmes.html", transformede)