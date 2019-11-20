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


xsl_index = Nokogiri::XSLT(File.read("index.xsl"))
#xsl_generos
#xsl_elenco
#xsl_duracao
html_index = xsl_index.transform(doc)



puts html_index


File.write("index.html", html_index)