require 'nokogiri'

#Validação DTD
xml = File.read("GioMovies.xml")
options = Nokogiri::XML::ParseOptions::DTDLOAD
doc = Nokogiri::XML::Document.parse(xml, nil, nil, options)
puts doc.external_subset.validate(doc) #Resposta vazia = XML válido



#Validação Schema
xsd = Nokogiri::XML::Schema(File.read('GioMovies.xsd'))
doc = Nokogiri::XML(File.read('GioMovies.xml'))
puts xsd.validate(doc) #Resposta vazia = XML válido



query_array = Array.new



puts "#--------------------------------------------------------------------------------------#"
puts "Quais são os tipos de gênero de filmes, sem repetição? \n\n"
doc.search('//topic[descendant::instanceOf/topicRef/@href=\'#Genero\']/baseName/baseNameString').each do |query|
    
    #Coloca os resultados e um array
    query_array << query.text

end

#Imprime os resultados sem espaçoes e repetições
puts query_array.map{|x| x.gsub(/\s+/, "")}.compact.uniq



puts "#--------------------------------------------------------------------------------------#"



puts "Quais são os títulos dos filmes que foram produzidos em 2000, ordenados alfabeticamente?\n\n"
doc.search('//topic[descendant::instanceOf/topicRef/@href=\'#Filme\' and concat(\'#\', @id)=//association[descendant::instanceOf/topicRef/@href=\'#filme-ano\' and descendant::member/topicRef/@href=\'#id_2000\']/member[1]/topicRef/@href]/baseName/baseNameString').each do |query|
    puts query.text
end



puts "#--------------------------------------------------------------------------------------#"



puts "Quais são os títulos em inglês dos filmes que tem a palavra 'especial' na sinopse?\n\n"
doc.search('//topic[descendant::instanceOf/topicRef/@href=\'#Filme\' and descendant::occurrence[scope/topicRef/@href=\'#sinopse\' and contains(resourceData, \'especial\')]]/occurrence[scope/topicRef/@href=\'#ingles\']/resourceData').each do |query|
    puts query.text
end



puts "#--------------------------------------------------------------------------------------#"



puts "Quais são os sites dos filmes que são do tipo 'thriller'?\n\n"
doc.search('//topic[instanceOf/topicRef/@href=\'#Filme\' and concat(\'#\', @id)=//association[descendant::instanceOf/topicRef/@href=\'#filme-genero\' and descendant::member[2]/topicRef/@href=\'#thriller\']/member[1]/topicRef/@href]/occurrence[instanceOf/topicRef/@href=\'#site\']/resourceRef/@href').each do |query|
    puts query.text
end



puts "#--------------------------------------------------------------------------------------#"



puts "Quantos filmes contém mais de 3 atores como elenco de apoio?\n\n"
puts doc.search('//topic[descendant::instanceOf/topicRef/@href=\'#Filme\' and count(descendant::occurrence[scope/topicRef/@href=\'#elencoApoio\'])>3]').length



puts "#--------------------------------------------------------------------------------------#"



puts "Quais são os ID dos filmes que tem o nome de algum membro do elenco citado na sinopse?\n\n"
doc.search('//topic[descendant::instanceOf/topicRef/@href=\'#Filme\' and descendant::occurrence[scope/topicRef/@href=\'#sinopse\' and contains(resourceData, descendant::occurrence[scope/topicRef/@href=\'#elencoApoio\']/resourceData)]]/@id').each do |query|
    puts query.text
end



puts "#--------------------------------------------------------------------------------------#"
