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
  <div>
	   <xsl:call-template name="commonattributes"/>
	    <xsl:call-template name="setidaname"/>
 <p class="edit-link" style="font-size: 17px; opacity: 0.6; text-align: right;"> 
      <a target="_blank">
        <xsl:attribute name="href">
          <xsl:value-of select="editlink:genlink($editlink.remote.ditamap.url, $editlink.local.ditamap.path, @xtrf)"/>
        </xsl:attribute>Edit on GitHub</a>
    </p>

	     <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]" mode="out-of-line"/>
	      <!-- here, you can generate a toc based on what's a child of body -->
	       <!--xsl:call-template name="gen-sect-ptoc"/--><!-- Works; not always wanted, though; could add a param to enable it.-->

	        <!-- Insert prev/next links. since they need to be scoped by who they're 'pooled' with, apply-templates in 'hierarchylink' mode to linkpools (or related-links itself) when they have children that have any of the following characteristics:
		            - role=ancestor (used for breadcrumb)
       - role=next or role=previous (used for left-arrow and right-arrow before the breadcrumb)
       - importance=required AND no role, or role=sibling or role=friend or role=previous or role=cousin (to generate prerequisite links)
       - we can't just assume that links with importance=required are prerequisites, since a topic with eg role='next' might be required, while at the same time by definition not a prerequisite -->

  <!-- Added for DITA 1.1 "Shortdesc proposal" -->
   <!-- get the abstract para -->
    <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/abstract ')]" mode="outofline"/>

     <!-- get the shortdesc para -->
      <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/shortdesc ')]" mode="outofline"/>

       <!-- Insert pre-req links - after shortdesc - unless there is a prereq section about -->
        <xsl:apply-templates select="following-sibling::*[contains(@class, ' topic/related-links ')]" mode="prereqs"/>

  <xsl:apply-templates/>
  <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]" mode="out-of-line"/>
  </div><xsl:value-of select="$newline"/>
</xsl:template>

</xsl:stylesheet>
