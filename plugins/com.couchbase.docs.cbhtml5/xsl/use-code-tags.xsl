<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xs">

	<xsl:template match="*[contains(@class, ' topic/pre ')][contains(@class, ' pr-d/codeblock ')]">
		<xsl:call-template name="spec-title-nospace" />
		<pre><code>
      <xsl:attribute name="class"><xsl:value-of select="name()" /></xsl:attribute>
      <xsl:call-template name="commonattributes" />
      <xsl:call-template name="setscale" />
      <xsl:call-template name="setidaname" />
    	<xsl:apply-templates />
		</code></pre>
		<xsl:value-of select="$newline" />
	</xsl:template>

</xsl:stylesheet>
