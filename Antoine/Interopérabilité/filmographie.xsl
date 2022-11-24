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
                <h1>Table des matières des films</h1>
                <xsl:apply-templates select="films/film" mode="tdm"/>
                <xsl:apply-templates select="films/film" mode="complet">
                    <xsl:sort select="film/exploitation/nbentrees" order="ascending" data-type="text" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film" mode="tdm">
            <xsl:element name="ul">
                <xsl:for-each select="titre">
                    <xsl:element name="li">
                        <a>
                            <xsl:attribute name="href">
                                #<xsl:value-of select="."/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:element>
                </xsl:for-each>
                (<xsl:value-of select="count(acteurs/acteur)"/> acteurs)
            </xsl:element>
    </xsl:template>

    <xsl:template match="film" mode="complet">
            <xsl:element name="div">
                <xsl:element name="H2">
                    <a>
                        <xsl:attribute name="name">
                            <xsl:value-of select="titre"/>
                        </xsl:attribute>
                        <xsl:value-of select="titre"/>
                    </a>
                    </xsl:element>
                <xsl:if test="@annee = 2006">
                    <xsl:element name="span">
                        <xsl:attribute name="class">nouveaute</xsl:attribute>
                            Nouveauté
                    </xsl:element>
                </xsl:if>
            </xsl:element>
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
