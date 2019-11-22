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
xsl_gender_template = Nokogiri::XML(File.read("xsl/gender_template.xsl"))
xsl_director_template = Nokogiri::XML(File.read("xsl/director_template.xsl"))
xsl_cast_template = Nokogiri::XML(File.read("xsl/cast_template.xsl"))
xsl_year_template = Nokogiri::XML(File.read("xsl/year_template.xsl"))
xsl_duration_template = Nokogiri::XML(File.read("xsl/duration_template.xsl"))



html_index = xsl_index.transform(doc)
html_generos = xsl_generos.transform(doc)
html_direcao = xsl_direcao.transform(doc)
html_elenco = xsl_elenco.transform(doc)
html_anos = xsl_anos.transform(doc)
html_duracao = xsl_duracao.transform(doc)



id_movie_array = html_index.search("//body/a/@href")
id_gender_array = html_generos.search("//body/a/@href")
id_director_array = html_direcao.search("//body/a/@href")
id_cast_array = html_elenco.search("//body/a/@href")
id_year_array = html_anos.search("//body/a/@href")
id_duration_array = html_duracao.search("//body/a/@href")


xsl_target = xsl_movie_template
xsl_file = "xsl/movie_template.xsl"



for id in id_movie_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end



xsl_target = xsl_gender_template
xsl_file = "xsl/gender_template.xsl"



for id in id_gender_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end



xsl_target = xsl_director_template
xsl_file = "xsl/director_template.xsl"



for id in id_director_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end


xsl_target = xsl_cast_template
xsl_file = "xsl/cast_template.xsl"



for id in id_cast_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end



xsl_target = xsl_year_template
xsl_file = "xsl/year_template.xsl"



for id in id_year_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end


xsl_target = xsl_duration_template
xsl_file = "xsl/duration_template.xsl"



for id in id_duration_array do

    target_tag = xsl_target.at_xpath("//xsl:variable")
    target_tag.content = id.text[0..-6]
    
    File.write(xsl_file, xsl_target)
    xsl_target = Nokogiri::XSLT(File.read(xsl_file))
    
    html_movie = xsl_target.transform(doc)
    
    xsl_target = Nokogiri::XML(File.read(xsl_file))

    File.write("html/"+id.text, html_movie)

end


File.write("html/index.html", html_index)
File.write("html/generos.html", html_generos)
File.write("html/diretores.html", html_direcao)
File.write("html/elenco.html", html_elenco)
File.write("html/anos.html", html_anos)
File.write("html/duracao.html", html_duracao)


