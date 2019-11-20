<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>


<xsl:template match="/">
  <html>
    <body>
        
        <h2>Filmes e tal</h2>


        <xsl:for-each select="topicMap/topic">
            <xsl:if test="instanceOf/topicRef[@href = '#Filme']">        

                <a>

                  <xsl:variable name="link"> <xsl:value-of select="./@id"/>.html</xsl:variable> 
                
                  <xsl:attribute name="href">
                    <xsl:value-of select="$link"/>
                  </xsl:attribute>
                  
                  <xsl:value-of select="baseName/baseNameString"/> 
              
                </a>
                <br/>

            </xsl:if>

        </xsl:for-each>


    </body>
  </html>
</xsl:template>

</xsl:stylesheet>