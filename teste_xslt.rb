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


xsl_index = Nokogiri::XSLT(File.read("xsl/index.xsl"))
xsl_generos = Nokogiri::XSLT(File.read("xsl/generos.xsl"))
xsl_direcao = Nokogiri::XSLT(File.read("xsl/diretores.xsl"))
xsl_elenco = Nokogiri::XSLT(File.read("xsl/elenco.xsl"))
xsl_anos = Nokogiri::XSLT(File.read("xsl/anos.xsl"))
xsl_duracao = Nokogiri::XSLT(File.read("xsl/duracao.xsl"))



xsl_movie_template = Nokogiri::XML(File.read("xsl/movie_template.xsl"))



html_index = xsl_index.transform(doc)
html_generos = xsl_generos.transform(doc)
html_direcao = xsl_direcao.transform(doc)
html_elenco = xsl_elenco.transform(doc)
html_anos = xsl_anos.transform(doc)
html_duracao = xsl_duracao.transform(doc)



id_movie_array = html_index.search("//body/a/@href")



for id in id_movie_array do

    target_tag = xsl_movie_template.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write("xsl/movie_template.xsl", xsl_movie_template)
    xsl_movie_template = Nokogiri::XSLT(File.read("xsl/movie_template.xsl"))
    
    html_movie = xsl_movie_template.transform(doc)
    
    xsl_movie_template = Nokogiri::XML(File.read("xsl/movie_template.xsl"))

    File.write("html/"+id.text, html_movie)

end


#puts id_movie_array


# puts html_index
# puts html_generos
# puts html_direcao
# puts html_elenco
# puts html_anos
# puts html_duracao


File.write("html/index.html", html_index)
File.write("html/generos.html", html_generos)
File.write("html/diretores.html", html_direcao)
File.write("html/elenco.html", html_elenco)
File.write("html/anos.html", html_anos)
File.write("html/duracao.html", html_duracao)


