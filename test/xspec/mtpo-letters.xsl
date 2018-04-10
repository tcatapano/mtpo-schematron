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
   <xsl:import href="O:/github/mtpo-schematron/test/../schema/mtpo-letters.sch-compiled.xsl"/>
   <xsl:import href="file:/O:/github/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:import href="file:/O:/github/xspec/src/schematron/sch-location-compare.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'O:/github/mtpo-schematron/test/../schema/mtpo-letters.sch-compiled.xsl'"/>
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
                   xspec="file:/O:/github/mtpo-schematron/test/mtpo-letters.xspec"
                   schematron="file:/O:/github/mtpo-schematron/schema/mtpo-letters.sch">
            <xsl:call-template name="x:d5e2"/>
            <xsl:call-template name="x:d5e9"/>
            <xsl:call-template name="x:d5e16"/>
            <xsl:call-template name="x:d5e23"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e2">
      <xsl:message>mtpo-letters-00015</xsl:message>
      <x:scenario>
         <x:label>mtpo-letters-00015</x:label>
         <xsl:call-template name="x:d5e3"/>
         <xsl:call-template name="x:d5e6"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e3">
      <xsl:message>..correct-app-anchor-id-match</xsl:message>
      <x:scenario>
         <x:label>correct-app-anchor-id-match</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e8.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e8.xml')"/>
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
      <xsl:message>mtpo-letters-00015 not assert</xsl:message>
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
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
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
         <x:label>mtpo-letters-00015 not assert</x:label>
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
      <xsl:message>..incorrect-app-anchor-id-match</xsl:message>
      <x:scenario>
         <x:label>incorrect-app-anchor-id-match</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e57.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e57.xml')"/>
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
      <xsl:message>mtpo-letters-00015 assert</xsl:message>
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
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
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
         <x:label>mtpo-letters-00015 assert</x:label>
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
      <xsl:message>mtpo-letters-00016</xsl:message>
      <x:scenario>
         <x:label>mtpo-letters-00016</x:label>
         <xsl:call-template name="x:d5e10"/>
         <xsl:call-template name="x:d5e13"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e10">
      <xsl:message>..correct-app-id</xsl:message>
      <x:scenario>
         <x:label>correct-app-id</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e109.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e109.xml')"/>
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
      <xsl:message>mtpo-letters-00016 not assert</xsl:message>
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
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
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
         <x:label>mtpo-letters-00016 not assert</x:label>
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
      <xsl:message>..incorrect-app-id</xsl:message>
      <x:scenario>
         <x:label>incorrect-app-id</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e127.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e127.xml')"/>
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
      <xsl:message>mtpo-letters-00016 assert</xsl:message>
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
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
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
         <x:label>mtpo-letters-00016 assert</x:label>
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
      <xsl:message>mtpo-letters-00017</xsl:message>
      <x:scenario>
         <x:label>mtpo-letters-00017</x:label>
         <xsl:call-template name="x:d5e17"/>
         <xsl:call-template name="x:d5e20"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e17">
      <xsl:message>..correct-note-type</xsl:message>
      <x:scenario>
         <x:label>correct-note-type</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e150.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e150.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e19">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e19">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>mtpo-letters-00017 not assert</xsl:message>
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
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
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
         <x:label>mtpo-letters-00017 not assert</x:label>
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
   <xsl:template name="x:d5e20">
      <xsl:message>..incorrect-note-type</xsl:message>
      <x:scenario>
         <x:label>incorrect-note-type</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e170.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e170.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e22">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e22">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>mtpo-letters-00017 assert</xsl:message>
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
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
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
         <x:label>mtpo-letters-00017 assert</x:label>
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
   <xsl:template name="x:d5e23">
      <xsl:message>mtpo-letters-00017</xsl:message>
      <x:scenario>
         <x:label>mtpo-letters-00017</x:label>
         <xsl:call-template name="x:d5e24"/>
         <xsl:call-template name="x:d5e27"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e24">
      <xsl:message>..correct-note-type</xsl:message>
      <x:scenario>
         <x:label>correct-note-type</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e194.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e194.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e26">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e26">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>mtpo-letters-00017 not assert</xsl:message>
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
                  <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
                                version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(svrl:schematron-output[svrl:fired-rule]) and empty(svrl:schematron-output/svrl:failed-assert)"
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
         <x:label>mtpo-letters-00017 not assert</x:label>
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
   <xsl:template name="x:d5e27">
      <xsl:message>..incorrect-note-type</xsl:message>
      <x:scenario>
         <x:label>incorrect-note-type</x:label>
         <x:context href="file:///O:/github/mtpo-schematron/test/xspec/context-d1e214.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc('file:///O:/github/mtpo-schematron/test/xspec/context-d1e214.xml')"/>
            <xsl:variable name="impl:context" select="$impl:context-doc"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e29">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e29">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>mtpo-letters-00017 assert</xsl:message>
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
                  <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="exists(svrl:schematron-output/svrl:failed-assert)" version="2"/>
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
         <x:label>mtpo-letters-00017 assert</x:label>
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
