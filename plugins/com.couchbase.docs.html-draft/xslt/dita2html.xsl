<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
	xmlns:ditamsg="http://dita-ot.sourceforge.net/ns/200704/ditamsg" version="2.0"
	xmlns:related-links="http://dita-ot.sourceforge.net/ns/200709/related-links"
	exclude-result-prefixes="dita-ot ditamsg">

	<xsl:import href="plugin:org.dita.xhtml:xsl/dita2html-base.xsl" />
	<xsl:import href="plugin:org.dita.xhtml:xsl/xslhtml/dita2html5Impl.xsl" />
	<xsl:import href="plugin:org.dita.xhtml:xsl/xslhtml/hi-d2html5.xsl" />
	<xsl:import href="plugin:org.dita.xhtml:xsl/map2htmtoc/map2htmlImpl.xsl" />

	<xsl:param name="FILEDIR" />
	<xsl:param name="FILENAME" />
	<xsl:param name="input.map.url" />
	<xsl:param name="DEVGUIDE" />

	<xsl:variable name="input.map" select="document($input.map.url)" />

	<xsl:variable name="OUTRELDIR">
		<xsl:choose>
			<xsl:when test="$FILEDIR=''">
				<xsl:value-of select="'.'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="replace($FILEDIR, '([^\\/](\\/))*([^\\/])+', '..')" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:output method="html" encoding="UTF-8" indent="no" omit-xml-declaration="yes" />

	<xsl:template match="/">


		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
		<html class="no-js developer-portal" lang="en">
			<head>
				<meta charset="utf-8" />
				<title>
					<xsl:variable name="topic.title"
						select="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]" />
					<xsl:value-of select="concat($topic.title, ' — ', $input.map/map/title)" />
				</title>

				<!--	<title>
		<xsl:apply-templates
			select="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]"
			mode="text-only" />
	</title>
-->
				<meta name="apple-mobile-web-app-title" content="Couchbase" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />

				<link rel="apple-touch-icon-precomposed" href="/apple-touch-icon-precomposed.png" />
				<link rel="stylesheet" href="{$OUTRELDIR}/assets/stylesheets/application.css" />
				<link rel="stylesheet" href="{$OUTRELDIR}/assets/stylesheets/docs.css" />
				
<!--				<script type="text/javascript">
					var _gaq = _gaq || [];
					_gaq.push(['_setAccount', 'UA-7763794-10']);
					_gaq.push(['_setDomainName', '.couchbase.com']);
					_gaq.push(['_setAllowLinker', true]);
					_gaq.push(['_setAllowHash', false]);
					_gaq.push(['_trackPageview']);
					(function() {
					var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
					ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
					var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
					})();
				</script>-->

				<!--[if lte IE 8]>
		<link rel="stylesheet" href="/assets/stylesheets/legacy.css">
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/html5shiv.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/respond.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/addEventListener.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/bind.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/trim.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/forEach.js"></script>
	<![endif]-->

				<!--[if lte IE 9]>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/classList.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/matchMedia.js"></script>
		<script src="{$OUTRELDIR}/assets/javascripts/polyfills/matchMedia.addListener.js"></script>
	<![endif]-->
			</head>
			<body data-modules="developer-portal-sidebar-navigation developer-portal-versions-navigation">


<xsl:text disable-output-escaping="yes"><![CDATA[
	<!-- Google Tag Manager -->
				<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-MVPNN2"
					height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
				<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
					new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
					j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
					'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
					})(window,document,'script','dataLayer','GTM-MVPNN2');</script>
				<!-- End Google Tag Manager -->
				]]></xsl:text>
				

				<header class="developer-portal-header" role="banner">
					<div class="layout-wrapper">
						<div class="developer-portal-header__hgroup">
							<h1 class="developer-portal-header__logo">
								<a href="http://couchbase.com" rel="home">Couchbase</a>
							</h1>
							<p class="developer-portal-header__page-title">
								<xsl:value-of select="$input.map/map/title" />
							</p>
							<!--<xsl:choose>
				<xsl:when test="$DEVGUIDE='yes'">
					<p class="developer-portal-header__page-title">Developing with Couchbase Server</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="developer-portal-header__page-title">Couchbase Server</p>
				</xsl:otherwise>
			</xsl:choose>-->
						</div>

						<nav class="developer-portal-header__navigation" id="primary-navigation"
							role="navigation">
							<div class="developer-portal-header__navigation__wrapper"
								id="primary-navigation__wrapper">

								<!--				<xsl:choose>
					<xsl:when test="$DEVGUIDE='yes'">
						<a href="http://www.couchbase.com/developers" class="developer-porta-header__navigation__back">
							Return to Developer Portal
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a href="http://www.couchbase.com/learn" class="developer-porta-header__navigation__back">
							Return to Learn
						</a>
					</xsl:otherwise>
				</xsl:choose>
-->
								<ul class="developer-portal-header__navigation__items">
									<!--					<xsl:choose>
						<xsl:when test="$DEVGUIDE='yes'">
							<li class="developer-portal-header__navigation__item">
								<a href="/admin">Couchbase Server Documentation</a>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li class="developer-portal-header__navigation__item">
								<a href="/developer">Developer Documentation</a>
							</li>
						</xsl:otherwise>
					</xsl:choose>-->

									<li class="developer-portal-header__navigation__item">
										<a href="/index.html">Documentation Home</a>
									</li>
									
									<!-- 
									<li class="developer-portal-header__navigation__item">
										<a href="/archive-index.html">Documentation Archive</a>
									</li>
									-->
									
									<li class="developer-portal-header__navigation__item">
										<a href="http://www.couchbase.com/nosql-databases/downloads">Downloads</a>
									</li>
									
									<li class="developer-portal-header__navigation__item">
										<a href="http://www.couchbase.com/open-source">Open Source Projects</a>
									</li>
									
									<li class="developer-portal-header__navigation__item">
										<a href="http://forums.couchbase.com">Forums</a>
									</li>
									
									
									
									<!--<li class="developer-portal-header__navigation__item">
										<a href="http://developer.couchbase.com/">Developer Portal</a>
									</li>
									<li class="developer-portal-header__navigation__item">
										<a href="http://www.couchbase.com/nosql-databases/downloads"
											>Downloads</a>
									</li>
									<li class="developer-portal-header__navigation__item">
										<a href="http://forums.couchbase.com">Forums</a>
									</li>-->

								</ul>

								<div class="developer-portal-header__search">
									<script>
					  (function() {
					    var cx = '018016427239405524608:fkg1v30apnm';
					    var gcse = document.createElement('script');
					    gcse.type = 'text/javascript';
					    gcse.async = true;
					    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
					        '//www.google.com/cse/cse.js?cx=' + cx;
					    var s = document.getElementsByTagName('script')[0];
					    s.parentNode.insertBefore(gcse, s);
					  })();
					</script>
									<xsl:text disable-output-escaping="yes">&lt;gcse:search>&lt;/gcse:search></xsl:text>
								</div>
							</div>
						</nav>
					</div>
				</header>

				<main class="developer-portal-global-content" role="main">
					<aside class="developer-portal-sidebar">
						<xsl:if test="$DEVGUIDE='no'">
							<div class="developer-portal-sidebar__versions">
								<ul id="developer-portal-versions-navigation">
									<li class="active">
										<a href="#">
											<span>Version 3.0</span>
										</a>
									</li>
									<li class="">
										<a href="http://docs.couchbase.com/archive-index">
											<span>Older</span>
										</a>
									</li>
								</ul>
							</div>
						</xsl:if>

						<nav class="developer-portal-sidebar__navigation">
							<div class="developer-portal-sidebar__navigation__wrapper"
								id="developer-portal-sidebar-navigation">
								<ul>
									<xsl:apply-templates select="*" mode="userSidetoc" />
								</ul>
							</div>
						</nav>
					</aside>

					<div class="developer-portal-content">
						<div class="developer-portal-content__wrapper textblock__content">
							<!-- Developer Portal: Couchbase Server content -->

							<xsl:apply-templates select="*" mode="chapterBody" />

						</div>

						<footer class="developer-portal-footer" role="contentinfo">
							<p class="legal">
								<span class="license">© 2011–2015 <b class="company-name">Couchbase</b>. All rights reserved.</span>
								<a href="http://support.couchbase.com/">Customer Login</a>
								<a href="http://www.couchbase.com/terms-of-service">Terms of Service</a>
								<a href="http://www.couchbase.com/privacy-policy">Privacy Policy</a>
							</p>
						</footer>
					</div>
				</main>

				<!-- usage info at http://prismjs.com/ -->
				<script src="{$OUTRELDIR}/assets/javascripts/vendor/prism.js" />
				<script type="text/javascript">var BASEPATH='<xsl:value-of select="$OUTRELDIR" />/';</script>
				<script src="{$OUTRELDIR}/assets/javascripts/init.js" />
				<script type="text/javascript" src="https://issues.couchbase.com/s/en_US-pvmaib-418945332/845/131/1.2.9/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?collectorId=86389172" />

			</body>
		</html>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' topic/related-links ')]" name="topic.related-links">
		<nav>
			<xsl:call-template name="commonattributes" />

			<h2>Related information</h2>

			<xsl:if test="$include.roles = ('child', 'descendant')">
				<xsl:call-template name="ul-child-links" />
				<!--handle child/descendants outside of linklists in collection-type=unordered or choice-->

				<xsl:call-template name="ol-child-links" />
				<!--handle child/descendants outside of linklists in collection-type=ordered/sequence-->
			</xsl:if>
			<xsl:if test="$include.roles = ('next', 'previous', 'parent')">
				<xsl:call-template name="next-prev-parent-links" />
				<!--handle next and previous links-->
			</xsl:if>
			<!-- Group all unordered links (which have not already been handled by prior sections). Skip duplicate links. -->
			<!-- NOTE: The actual grouping code for related-links:group-unordered-links is common between
					transform types, and is located in ../common/related-links.xsl. Actual code for
					creating group titles and formatting links is located in XSL files specific to each type. -->
			<xsl:apply-templates select="." mode="related-links:group-unordered-links">
				<xsl:with-param name="nodes"
					select="descendant::*[contains(@class, ' topic/link ')]
																					[not(related-links:omit-from-unordered-links(.))]
																					[generate-id(.) = generate-id(key('hideduplicates', related-links:hideduplicates(.))[1])]"
				 />
			</xsl:apply-templates>

			<!--linklists - last but not least, create all the linklists and their links, with no sorting or re-ordering-->
			<xsl:apply-templates select="*[contains(@class, ' topic/linklist ')]" />
		</nav>
	</xsl:template>

	<xsl:template match="*" mode="chapterBody">
		<xsl:call-template name="generateBreadcrumbs" />
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="*" mode="userSidetoc">
		<xsl:apply-templates select="$current-topicrefs[1]" mode="toc-pull">
			<xsl:with-param name="pathFromMaplist" select="$PATH2PROJ" />
			<xsl:with-param name="children">
				<xsl:apply-templates
					select="$current-topicrefs[1]/*[contains(@class, ' map/topicref ')]" mode="toc">
					<xsl:with-param name="pathFromMaplist" select="$PATH2PROJ" />
				</xsl:apply-templates>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>


	<!-- Navigation -->

	<xsl:variable name="current-file"
		select="translate(if ($FILEDIR = '.') then $FILENAME else concat($FILEDIR, '/', $FILENAME), '\', '/')" />
	<xsl:variable name="current-topicrefs"
		select="$input.map//*[contains(@class, ' map/topicref ')][dita-ot:get-path($PATH2PROJ, .) = $current-file]" />
	<xsl:variable name="current-topicref" select="$current-topicrefs[1]" />

	<xsl:template match="*[contains(@class, ' map/map ')]" mode="toc-pull">
		<xsl:param name="pathFromMaplist" select="$PATH2PROJ" />
		<xsl:param name="children" select="/.." />
		<xsl:param name="parent" select="parent::*" />

		<xsl:copy-of select="$children" />
	</xsl:template>

	<xsl:template match="*" mode="toc-pull" priority="-10">
		<xsl:param name="pathFromMaplist" />
		<xsl:param name="children" select="/.." />
		<xsl:param name="parent" select="parent::*" />
		<xsl:apply-templates select="$parent" mode="toc-pull">
			<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
			<xsl:with-param name="children" select="$children" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template
		match="*[contains(@class, ' map/topicref ')]
                        [not(@toc = 'no')]
                        [not(@processing-role = 'resource-only')]"
		mode="toc-pull" priority="10">
		<xsl:param name="pathFromMaplist" />
		<xsl:param name="children" select="/.." />
		<xsl:param name="parent" select="parent::*" />
		<xsl:variable name="title">
			<xsl:apply-templates select="." mode="get-navtitle" />
		</xsl:variable>
		<xsl:apply-templates select="$parent" mode="toc-pull">
			<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
			<xsl:with-param name="children">
				<xsl:apply-templates select="preceding-sibling::*[contains(@class, ' map/topicref ')]"
					mode="toc">
					<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
				</xsl:apply-templates>
				<xsl:choose>
					<xsl:when test="normalize-space($title)">
						<li class="section">
							<xsl:if test="topicref">
								<xsl:attribute name="class">section section--has-sub-sections
									section--active</xsl:attribute>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="normalize-space(@href)">
									<a>
										<xsl:attribute name="href">
											<xsl:if test="not(@scope = 'external')">
												<xsl:value-of select="$pathFromMaplist" />
											</xsl:if>
											<xsl:choose>
												<xsl:when
													test="@copy-to and not(contains(@chunk, 'to-content')) and
                                        (not(@format) or @format = 'dita' or @format = 'ditamap') ">
													<xsl:call-template name="replace-extension">
														<xsl:with-param name="filename" select="@copy-to" />
														<xsl:with-param name="extension" select="$OUTEXT" />
													</xsl:call-template>
													<xsl:if
														test="not(contains(@copy-to, '#')) and contains(@href, '#')">
														<xsl:value-of
															select="concat('#', substring-after(@href, '#'))" />
													</xsl:if>
												</xsl:when>
												<xsl:when
													test="not(@scope = 'external') and (not(@format) or @format = 'dita' or @format = 'ditamap')">
													<xsl:call-template name="replace-extension">
														<xsl:with-param name="filename" select="@href" />
														<xsl:with-param name="extension" select="$OUTEXT" />
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@href" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:if test=". is $current-topicref">
											<xsl:attribute name="class">current</xsl:attribute>
										</xsl:if>
										<span>
											<xsl:value-of select="$title" />
										</span>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<span>
										<xsl:value-of select="$title" />
									</span>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$children">
								<ul class="sub-sections">
									<xsl:copy-of select="$children" />
								</ul>
							</xsl:if>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="*[contains(@class, ' map/topicref ')]" mode="toc">
							<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates select="following-sibling::*[contains(@class, ' map/topicref ')]"
					mode="toc">
					<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
				</xsl:apply-templates>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="*" mode="toc" priority="-10">
		<xsl:param name="pathFromMaplist" />
		<xsl:apply-templates select="*[contains(@class, ' map/topicref ')]" mode="toc">
			<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' mapgroup-d/topicgroup ')]" mode="toc-pull"
		priority="15">
		<li>SHOULD NOT REACH THIS</li>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' mapgroup-d/topicgroup ')]" mode="toc" priority="15">
		<xsl:param name="pathFromMaplist" />
		<xsl:apply-templates select="*[contains(@class, ' map/topicref ')]" mode="toc">
			<xsl:with-param name="pathFromMaplist" select="$pathFromMaplist" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template
		match="*[contains(@class, ' map/topicref ')]
                        [not(@toc = 'no')]
                        [not(@processing-role = 'resource-only')]"
		mode="toc" priority="10">
		<xsl:param name="pathFromMaplist" />
		<xsl:variable name="title">
			<xsl:apply-templates select="." mode="get-navtitle" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="normalize-space($title)">
				<li class="section">
					<xsl:if test="topicref">
						<xsl:attribute name="class">section section--has-sub-sections</xsl:attribute>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="normalize-space(@href)">
							<a>
								<xsl:attribute name="href">
									<xsl:if test="not(@scope = 'external')">
										<xsl:value-of select="$pathFromMaplist" />
									</xsl:if>
									<xsl:choose>
										<xsl:when
											test="@copy-to and not(contains(@chunk, 'to-content')) and
                                      (not(@format) or @format = 'dita' or @format = 'ditamap') ">
											<xsl:call-template name="replace-extension">
												<xsl:with-param name="filename" select="@copy-to" />
												<xsl:with-param name="extension" select="$OUTEXT" />
											</xsl:call-template>
											<xsl:if
												test="not(contains(@copy-to, '#')) and contains(@href, '#')">
												<xsl:value-of select="concat('#', substring-after(@href, '#'))"
												 />
											</xsl:if>
										</xsl:when>
										<xsl:when
											test="not(@scope = 'external') and (not(@format) or @format = 'dita' or @format = 'ditamap')">
											<xsl:call-template name="replace-extension">
												<xsl:with-param name="filename" select="@href" />
												<xsl:with-param name="extension" select="$OUTEXT" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@href" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<span>
									<xsl:value-of select="$title" />
								</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$title" />
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:function name="dita-ot:get-path">
		<xsl:param name="pathFromMaplist" />
		<xsl:param name="node" />
		<xsl:for-each select="$node[1]">
			<xsl:if test="not(@scope = 'external')">
				<xsl:call-template name="strip-leading-parent">
					<xsl:with-param name="path" select="$pathFromMaplist" />
				</xsl:call-template>
			</xsl:if>
			<xsl:choose>
				<xsl:when
					test="@copy-to and not(contains(@chunk, 'to-content')) and
                        (not(@format) or @format = 'dita' or @format = 'ditamap') ">
					<xsl:value-of select="@copy-to" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@href" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:function>

	<xsl:template name="strip-leading-parent">
		<xsl:param name="path" />
		<xsl:choose>
			<xsl:when test="starts-with($path, '../')">
				<xsl:call-template name="strip-leading-parent">
					<xsl:with-param name="path" select="substring($path, 4)" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$path" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*[contains(@class,' topic/pre ')]" name="topic.pre">
		<!-- This template is deprecated in DITA-OT 1.7. Processing will moved into the main element rule. -->
		<xsl:if test="contains(@frame, 'top')">
			<hr />
		</xsl:if>
		<xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
			mode="out-of-line" />
		<xsl:call-template name="spec-title-nospace" />
		<pre>
    <xsl:attribute name="class"><xsl:value-of select="name()" /></xsl:attribute>
    <xsl:call-template name="commonattributes" />
    <xsl:call-template name="setscale" />
    <xsl:call-template name="setidaname" />
		<code>
    	<xsl:apply-templates />
		</code>
  </pre>
		<xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
			mode="out-of-line" />
		<xsl:if test="contains(@frame, 'bot')">
			<hr />
		</xsl:if>
		<xsl:value-of select="$newline" />
	</xsl:template>

</xsl:stylesheet>
