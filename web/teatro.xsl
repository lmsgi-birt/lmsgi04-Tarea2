<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<!-- Selecciona todos los nodos que cuelgan de reservaeventos -->
<xsl:template match='/reservaeventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
				<ul>
					<!-- Almacenamos la fecha que queremos usar como selección -->
					<xsl:variable name="fecha" select="'2023-01'" />

					<!-- Selecciona solo las obras de enero de 2023 -->
					<xsl:for-each select="teatro[substring(fechahora/@dia, 0, 8)=$fecha]">

						<!-- Las ordenamos por fecha de más reciente a menos  -->
						<xsl:sort select="fechahora/@dia" order="descending" />

						<!-- 
							Si el precio es menor que 20 aplicamos la clase "subrayado" 
							Se ha utilizado la sentencia if pero se podría haber usado tambien la sentencia choose
						-->
						<xsl:if test="precio&lt;20">
							<li class="subrayado"><xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" /> </li>
						</xsl:if>
						<xsl:if test="precio>=20">
							<li><xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" /> </li>
						</xsl:if>
					</xsl:for-each>
				</ul>
			</section>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>