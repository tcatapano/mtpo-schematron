<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:__x="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:pkg="http://expath.org/ns/pkg"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="2.0"
                exclude-result-prefixes="pkg impl">
   <xsl:import href="o:/github/mtpo-schematron/test/../schema/mtpo-general.sch-compiled.xsl"/>
   <xsl:import href="file:/O:/github/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:import href="file:/O:/github/xspec/src/schematron/sch-location-compare.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'o:/github/mtpo-schematron/test/../schema/mtpo-general.sch-compiled.xsl'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/O:/github/xspec/src/compiler/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}"
                   date="{current-dateTime()}"
                   xspec="file:/o:/github/mtpo-schematron/test/mtpo-general.xspec"
                   schematron="file:/o:/github/mtpo-schematron/schema/mtpo-general.sch">
            <xsl:call-template name="x:d5e2"/>
            <xsl:call-template name="x:d5e9"/>
            <xsl:call-template name="x:d5e22"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e2">
      <xsl:message>general-0001</xsl:message>
      <x:scenario>
         <x:label>general-0001</x:label>
         <xsl:call-template name="x:d5e3"/>
         <xsl:call-template name="x:d5e6"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e3">
      <xsl:message>..correct</xsl:message>
      <x:scenario>
         <x:label>correct</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e8.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e8.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>not report general-0001</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:successful-report[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0001'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:successful-report[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0001'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>not report general-0001</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e6">
      <xsl:message>..incorrect repeated xml:id</xsl:message>
      <x:scenario>
         <x:label>incorrect repeated xml:id</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e23.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e23.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e8">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e8">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>report general-0001</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:successful-report[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0001'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:successful-report[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0001'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>report general-0001</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e9">
      <xsl:message>general-0002</xsl:message>
      <x:scenario>
         <x:label>general-0002</x:label>
         <xsl:call-template name="x:d5e10"/>
         <xsl:call-template name="x:d5e13"/>
         <xsl:call-template name="x:d5e16"/>
         <xsl:call-template name="x:d5e19"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e10">
      <xsl:message>..correct-TEI.2</xsl:message>
      <x:scenario>
         <x:label>correct-TEI.2</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e41.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e41.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e12">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e12">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>not assert general-0002.01</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.01'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.01'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>not assert general-0002.01</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e13">
      <xsl:message>..correct-TEI</xsl:message>
      <x:scenario>
         <x:label>correct-TEI</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e58.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e58.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e15">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e15">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>not assert general-0002.02</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.02'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.02'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>not assert general-0002.02</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e16">
      <xsl:message>..incorrect non matching TEI.2 id</xsl:message>
      <x:scenario>
         <x:label>incorrect non matching TEI.2 id</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e75.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e75.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e18">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e18">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>assert general-0002.01</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.01'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.01'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>assert general-0002.01</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e19">
      <xsl:message>..incorrect non matching TEI xml:id</xsl:message>
      <x:scenario>
         <x:label>incorrect non matching TEI xml:id</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e92.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e92.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e21">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e21">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>assert general-0002.02</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.02'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'general-0002.02'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>assert general-0002.02</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e22">
      <xsl:message>publicationStmt</xsl:message>
      <x:scenario>
         <x:label>publicationStmt</x:label>
         <xsl:call-template name="x:d5e23"/>
         <xsl:call-template name="x:d5e26"/>
         <xsl:call-template name="x:d5e29"/>
         <xsl:call-template name="x:d5e32"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e23">
      <xsl:message>..correct sort date</xsl:message>
      <x:scenario>
         <x:label>correct sort date</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e112.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e112.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e25">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e25">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>not assert pubSt-0001</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0001'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0001'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>not assert pubSt-0001</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e26">
      <xsl:message>..incorrect no sort date</xsl:message>
      <x:scenario>
         <x:label>incorrect no sort date</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e129.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e129.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e28">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e28">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>assert pubSt-0001</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0001'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0001'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>assert pubSt-0001</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e29">
      <xsl:message>..correct pub date</xsl:message>
      <x:scenario>
         <x:label>correct pub date</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e146.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e146.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e31">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e31">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>not assert pubSt-0002</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0002'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0002'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>not assert pubSt-0002</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e32">
      <xsl:message>..incorrect no pub date</xsl:message>
      <x:scenario>
         <x:label>incorrect no pub date</x:label>
         <x:context href="file:///o:/github/mtpo-schematron/test/xspec/context-d1e166.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///o:/github/mtpo-schematron/test/xspec/context-d1e166.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e34">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e34">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>assert pubSt-0002</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0002'])"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert[(@id, preceding-sibling::svrl:fired-rule[1]/@id, preceding-sibling::svrl:active-pattern[1]/@id)[1] = 'pubSt-0002'])"
                             version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>assert pubSt-0002</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
