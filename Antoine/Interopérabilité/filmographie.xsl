<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-1" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head> 
                <title> cinématographie </title>
                <link rel="stylesheet" type="text/css" href="film.css"/>
            </head>
            <body>
                <xsl:apply-templates select="title"/>
                <xsl:apply-templates select="films/film"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="film">
        <xsl:for-each select="titre">
            <xsl:element name="H2">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
        Film
        <xsl:for-each select="genres/genre">
            <xsl:element name="i">
                <xsl:value-of select="."/>
            </xsl:element> 
        </xsl:for-each>,
        <xsl:value-of select="nationalite"/>
        de
        <xsl:value-of select="duree"/>
        <xsl:value-of select="duree/@unite"/>
        sorti en
        <xsl:value-of select="@annee"/> <br/>
        <xsl:element name="b">
            Réalisé par
            <xsl:value-of select="realisateur"/>
        </xsl:element>
        <xsl:element name="ul">
            <xsl:for-each select="acteurs/acteur">
                <xsl:element name="li">
                    <xsl:value-of select="@nom"/>
                    <span>, </span>
                    <xsl:value-of select="@prenom"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="class">histoireStyle</xsl:attribute>
            <xsl:value-of select="scenario"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="title">
        <xsl:value-of select="title"/>
        <xsl:element name="H1">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
