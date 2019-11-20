<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
        <h2>Filmes e tal</h2>
        <xsl:for-each select="topicMap/topic">
            <xsl:if test="instanceOf/topicRef[@href = '#Filme']">
                <h4><xsl:value-of select="baseName/baseNameString"></h4>
            </xsl:if>
        </xsl:for-each>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>