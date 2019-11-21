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
xsl_generos = Nokogiri::XSLT(File.read("generos.xsl"))
xsl_direcao = Nokogiri::XSLT(File.read("diretores.xsl"))
xsl_elenco = Nokogiri::XSLT(File.read("elenco.xsl"))
xsl_anos = Nokogiri::XSLT(File.read("anos.xsl"))
xsl_duracao = Nokogiri::XSLT(File.read("duracao.xsl"))

html_index = xsl_index.transform(doc)
html_generos = xsl_generos.transform(doc)
html_direcao = xsl_direcao.transform(doc)
html_elenco = xsl_elenco.transform(doc)
html_anos = xsl_anos.transform(doc)
html_duracao = xsl_duracao.transform(doc)


puts html_index
puts html_generos
puts html_direcao
puts html_elenco
puts html_anos
puts html_duracao


File.write("index.html", html_index)
File.write("generos.html", html_generos)
File.write("diretores.html", html_direcao)
File.write("elenco.html", html_elenco)
File.write("anos.html", html_anos)
File.write("duracao.html", html_duracao)

