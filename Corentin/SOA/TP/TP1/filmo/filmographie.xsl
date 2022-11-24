<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="iso-8859-1" indent="yes"/>
<xsl:template match="/films">
<html>
    <link rel="stylesheet" type="text/css" href="film.css" /><head> 
        <title> Filmographie </title> 
    </head>
<body>
    <h1> Filmographie </h1>
    <h1>Table des matières des films</h1>
    <xsl:apply-templates select="film" mode="tdm">
    <xsl:sort select="exploitation/nbEntrees" order="ascending" data-type="number" />
    </xsl:apply-templates>
    <h1>Table des matières des acteurs</h1>
    <xsl:apply-templates select="acteurDescription" mode="tdm" />
    <xsl:apply-templates select="film" mode="complet">
        <xsl:sort select="exploitation/nbEntrees" order="ascending" data-type="number" />
    </xsl:apply-templates>
    
  
</body>
</html>
</xsl:template>

<xsl:template match="film" mode="tdm">
    <ul><xsl:apply-templates select="titre" /></ul>
</xsl:template>

<xsl:template match="titre">
    <li>
        <a>
            <xsl:attribute name="href">
                #<xsl:value-of select="." />
            </xsl:attribute>
            <xsl:value-of select="." />
            (<xsl:value-of select="count(../acteurs/acteur)" /> acteurs)
        </a>
    </li>
</xsl:template>

<xsl:template match="acteurDescription" mode="tdm">
        <li>
            <xsl:variable name="acteurId" select="@id" />
            <xsl:if test="contains(//acteurDescription[@id=$acteurId]/sexe, 'M')">
                <span class="Homme">
                    <xsl:value-of select="//acteurDescription[@id=$acteurId]/prenom" />
                </span>
            </xsl:if>
            <xsl:if test="contains(//acteurDescription[@id=$acteurId]/sexe, 'F')">
                <span class="Femme">
                    <xsl:value-of select="//acteurDescription[@id=$acteurId]/prenom" />
                </span>
            </xsl:if>
            &#160;
            <xsl:value-of select="//acteurDescription[@id=$acteurId]/nom" />,

            <xsl:value-of select="//acteurDescription[@id=$acteurId]/dateNaissance" />
            (<xsl:value-of select="count(//acteurs/acteur[@ref=$acteurId])" /> films)
        </li>
    </xsl:template>

<xsl:template match="film" mode="complet">
 <h2><xsl:value-of select="titre" /></h2>
 <xsl:variable name="imgFilm" select="image/@ref"/>
 <img src="{$imgFilm}" alt="imgfilm" />

 <a class="test"><xsl:if test="@annéeSortie=2006">Nouveauté <br/></xsl:if></a>
 <br/><i>films <xsl:value-of select="genre"/> de 
    <xsl:value-of select="durée"/> minutes
    sorti en <xsl:value-of select="@annéeSortie"/>.
</i> <br/>
<b>réalisé par 
    <xsl:value-of select="réalisateur"/>
</b>
<h3>Acteurs</h3>
<ul>
    <xsl:apply-templates select="acteurs/acteur"/>
</ul>
<xsl:apply-templates select="scénario"/>
</xsl:template>

<xsl:template match="acteur">
    <li><xsl:value-of select="text()"/></li>
</xsl:template>

<xsl:template match="scénario" >
<h3>Scénario</h3>
<p class="histoireStyle"><xsl:value-of select="."/></p>
</xsl:template>



</xsl:stylesheet>
