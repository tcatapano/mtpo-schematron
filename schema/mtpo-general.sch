<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="*[@xml:id]">
            <sch:let name="myID" value="normalize-space(@xml:id)"/>
            <sch:report id="general-0001" test="preceding::*/@xml:id[ normalize-space(.) = $myID ]
                ">The @xml:id "<sch:value-of select="@xml:id"
                />" on &lt;<sch:value-of select="name(.)"
                />&gt; duplicates an @xml:id found earlier in the document: <sch:value-of select="preceding::*/@xml:id[ normalize-space(.)]"/> on <sch:value-of select="name(preceding::*[@xml:id][1])"/></sch:report>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="TEI.2">
            <sch:assert id="general-0002.01" test="@id = descendant::idno[@type = 'LOCAL']">The element <sch:name/> must have an id attribute with its value equal to a descendant idno element with type = 'LOCAL'</sch:assert>
        </sch:rule>
        <sch:rule context="TEI">
            <sch:assert id="general-0002.02" test="@xml:id = descendant::idno[@type = 'LOCAL']">The element <sch:name/> must have an xml:id attribute with its value equal to a descendant idno element with type = 'LOCAL'</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="publicationStmt">
            <sch:assert id="pubSt-0001" test="child::date/@type = 'sort'">The <sch:name/> element must have a child date element with a type attribute with value 'sort'</sch:assert>
            <sch:assert id="pubSt-0002" test="child::date/@type = 'pub'">The <sch:name/> element must have a child date element with a type attribute with value 'pub'</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>