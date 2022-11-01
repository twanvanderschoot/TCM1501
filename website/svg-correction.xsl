<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" xml:space="default" version="2.0">
    <xsl:output method="html"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> 2020-02-02</xd:p>
            <xd:p><xd:b>Author:</xd:b>Twan van der Schoot</xd:p>
            <xd:p><xd:b>Affiliation</xd:b>TWAN.COM</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>    