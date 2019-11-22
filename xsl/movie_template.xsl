<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="link">x-men-2</xsl:variable>


    <xsl:template match="/">

    <html>
        <header>
            <a href="index.html">Filmes</a>
            <a href="generos.html">Generos</a>
            <a href="diretores.html">Diretores</a>
            <a href="elenco.html">Elenco</a>
            <a href="anos.html">Anos</a>
            <a href="duracao.html">Duração</a>
        </header>

        

        <body>
            
                <h1> 
                    <xsl:value-of select="//topic[@id = $link]/baseName/baseNameString"/>
                </h1>

                <h3>
                    <xsl:value-of select="////topic[@id= $link]/occurrence[scope/topicRef/@href='#ingles']/resourceData"/>                    
                </h3>



                <h2>Distribuição</h2>
                <h3>
                    <xsl:value-of select="//topic[@id=$link]/occurrence[scope/topicRef/@href='#distribuicao']/resourceData"/>
                </h3>    
                


                <h2>Sinopse</h2>
                <p>
                    <xsl:value-of select="//topic[@id=$link]/occurrence[scope/topicRef/@href='#sinopse']/resourceData"/>
                </p>

                
                <h2>Duração</h2>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="//topic[instanceOf/topicRef/@href='#Filme' and concat('#', @id)=//association[descendant::instanceOf/topicRef/@href='#filme-duracao' and descendant::member[2]/topicRef/@href=concat('#',$link)]/member[1]/topicRef/@href]/@id"/>.html
                        </xsl:attribute>
                
                        <xsl:value-of select="//topic[instanceOf/topicRef/@href='#Filme' and concat('#', @id)=//association[descendant::instanceOf/topicRef/@href='#filme-duracao' and descendant::member[2]/topicRef/@href=concat('#',$link)]/member[1]/topicRef/@href]/baseName/baseNameString"/>
                    </a>


                
                <h2>Direção</h2>

                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-direcao']/../../member/topicRef[@href= concat('#', $link)]/../../member[2]/topicRef/@href]/@id"/>.html
                    </xsl:attribute>

                    <h3>
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-direcao']/../../member/ topicRef[@href= concat('#', $link)]/../../member[2]/topicRef/@href]/baseName/baseNameString"/>
                    </h3>
                </a>
                

               
                <h2>Elenco</h2>
               
               <xsl:for-each select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-elenco']/../../member/topicRef[@href = concat('#', $link)]/../../member[2]/topicRef/@href]">
               <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@id"/>.html
                    </xsl:attribute>

                    <h3>
                        <xsl:value-of select="baseName/baseNameString"/>
                    </h3>
                </a>
                </xsl:for-each>



                <h2>Elenco Apoio</h2>
                
                <xsl:for-each select="//topic[@id=$link]/occurrence[scope/topicRef/@href='#elencoApoio']">
                    <h3>
                        <xsl:value-of select="./resourceData"/>
                    </h3>
                </xsl:for-each>



                <h2>Ano</h2>

                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-ano']/../../member/topicRef[@href= concat('#', $link)]/../../member[2]/topicRef/@href]/@id"/>.html
                    </xsl:attribute>

                    <h3>
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-ano']/../../member/topicRef[@href= concat('#', $link)]/../../member[2]/topicRef/@href]/baseName/baseNameString"/>
                    </h3>
                </a>
                
                
                
                <h2>Genero</h2>    

                <a>    
                    
                    <xsl:attribute name="href">
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-genero']/../../member/topicRef[@href = concat('#', $link)]/../../member[2]/topicRef/@href]/@id"/>.html
                    </xsl:attribute>
                    
                    <h3>
                        <xsl:value-of select="//topic[concat('#',@id) = //association/instanceOf/topicRef[@href='#filme-genero']/../../member/topicRef[@href = concat('#', $link)]/../../member[2]/topicRef/@href]/baseName/baseNameString"/>
                    </h3>
                </a>



                <h2>Site</h2>
                <h3>
                    <xsl:value-of select="//topic[@id=$link]/occurrence[instanceOf/topicRef/@href='#site']/../occurrence/resourceRef/@href"/>
                </h3>
    </body>


    </html>

</xsl:template>
</xsl:stylesheet>
