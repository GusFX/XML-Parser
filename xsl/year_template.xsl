<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="link">id_2003</xsl:variable>


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

        

        <xsl:for-each select="//topic[instanceOf/topicRef/@href='#Filme' and concat('#', @id)=//association[descendant::instanceOf/topicRef/@href='#filme-ano' and descendant::member[2]/topicRef/@href=concat('#',$link)]/member[1]/topicRef/@href]">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="@id"/>.html
                </xsl:attribute>
                
                <xsl:value-of select="baseName/baseNameString"/>
            </a>
            <br/>
        </xsl:for-each>

    </html>

        </xsl:template>
</xsl:stylesheet>
