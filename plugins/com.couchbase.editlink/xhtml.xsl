<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs editlink"
    xmlns:editlink="http://couchbase.com/editlink/"
    version="2.0">
  
  <xsl:import href="link.xsl"/>
  
  <xsl:param name="editlink.remote.ditamap.url"/>
  <xsl:param name="editlink.local.ditamap.path"/>
  
<xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/body ')]" 
  use-when="system-property('editlink.remote.ditamap.url') != '${editlink.remote.ditamap.url}'">
  
  <xsl:element name="div">
    <xsl:attribute name="class">body</xsl:attribute>
    <xsl:call-template name="commonattributes">
    </xsl:call-template>
    <!-- The edit link -->
    <p class="edit-link" style="font-size: 17px; opacity: 0.6; text-align: right;"> 
      <a target="_blank">
        <xsl:attribute name="href">
          <xsl:value-of select="editlink:genlink($editlink.remote.ditamap.url, $editlink.local.ditamap.path, @xtrf)"/>
        </xsl:attribute>Edit on GitHub</a>
    </p>
    <!-- Done with the edit link -->

      <xsl:apply-templates/>

     </xsl:element>      
  
  <xsl:value-of select="$newline"/>
</xsl:template>

</xsl:stylesheet>
