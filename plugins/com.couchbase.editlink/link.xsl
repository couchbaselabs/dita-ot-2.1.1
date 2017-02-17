<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="urn:localfunctions"
    xmlns:editlink="http://couchbase.com/editlink/"
    exclude-result-prefixes="editlink xs local"  
    >

    <xsl:function name="editlink:genlink" as="xs:string">
        <xsl:param name="remote.ditamap.url" as="xs:string"/>
        <xsl:param name="local.ditamap.path" as="xs:string"/>
        <xsl:param name="local.topic.file.url" as="xs:string"/>

        <xsl:variable name="file.rel.path">
            <xsl:value-of select="resolve-uri(editlink:makeRelative(editlink:toUrl($local.ditamap.path), $local.topic.file.url), $remote.ditamap.url)"/>
        </xsl:variable>
    
        <xsl:value-of select="$file.rel.path"/>
    </xsl:function>
    

    <!-- Makes the topic URL relative to the map URL. -->
    <xsl:function name="editlink:makeRelative" as="xs:string">
        <xsl:param name="map" as="xs:string"/>
        <xsl:param name="topic" as="xs:string"/>

        <xsl:variable name="normalizedMap" as="xs:string">
            <xsl:value-of select="tokenize($map, '/')[.!='' and .!='.' and position()!=last()]" separator="/" />
        </xsl:variable>
        <xsl:variable name="mapBase" as="xs:string" select="concat($normalizedMap, '/')"/>
        <xsl:variable name="normalizedTopic" as="xs:string">
            <xsl:value-of select="tokenize($topic, '/')[.!='' and .!='.']" separator="/" />
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$map=''"><xsl:value-of select="''"/></xsl:when>
            <xsl:when test="starts-with($normalizedTopic, $mapBase)">
                <xsl:value-of select="substring-after($normalizedTopic, $mapBase)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="x" select="editlink:makeRelative($normalizedMap, $normalizedTopic)"/>
                <xsl:choose>
                    <xsl:when test="$x=''">
                        <xsl:value-of select="''"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('../', $x)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="editlink:toUrl" as="xs:string">
        <xsl:param name="filepath" as="xs:string"/>
        <xsl:variable name="url" as="xs:string"
            select="if (contains($filepath, '\'))
            then translate($filepath, '\', '/')
            else $filepath
            "
        />
        <xsl:variable name="fileUrl" as="xs:string"
            select="
            if (matches($url, '^[a-zA-Z]:'))
            then concat('file:/', $url)
            else if (starts-with($url, '/')) 
            then concat('file:', $url) 
            else $url
            "
        />
        <xsl:variable name="escapedUrl" 
            select="replace($fileUrl, ' ', '%20')"
        />
        <xsl:sequence select="$escapedUrl"/>
    </xsl:function>
</xsl:stylesheet>
