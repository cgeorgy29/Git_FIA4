<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Exo 1 
<xsl:template match="/recette">
<html>
    <head>
        <title><xsl:value-of select="entete/titre"/></title>
    </head>
<body>
    <h1><xsl:value-of select="entete/titre"/></h1>
    <xsl:value-of select="entete/auteur"/>
    <b>Remarque : </b><xsl:value-of select="entete/remarque"/>

    <h2>Procédure</h2>
    <xsl:apply-templates select="procedure"/>



</body>
</html>

</xsl:template>
-->

<xsl:template match="/bouteilles">
<html>
    <body>
    <xsl:apply-templates select="bouteille"/>
            
</body>

</html>
</xsl:template>


<xsl:template match="bouteille">

        <h1>Bouteille de marque <xsl:value-of select="marque"/></h1>
        <h2>Liste des ions contenus avec leur quantité</h2>
        <ul>
            <xsl:apply-templates select="composition/ion"/>
        </ul>
        <h2>Lieu d'origine :</h2>
        Ville <xsl:value-of select="source/ville"/>, dans le département du <xsl:value-of select="source/departement"/>
        
        <h2>Autres Information</h2>
        <ul>
            <li>Ph: <xsl:value-of select="ph"/></li>
            <li>Contenance : <xsl:value-of select="contenance"/></li>
        </ul>


</xsl:template>

<xsl:template match="ion">
    <li><xsl:value-of select="text()"/>( <xsl:value-of select="quantite"/></li>
</xsl:template>














</xsl:stylesheet>