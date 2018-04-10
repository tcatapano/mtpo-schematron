<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
    <sch:pattern>
        <sch:rule context="tei:app">
            <sch:assert id="letters-0002.15" test="@from = preceding::tei:anchor/@xml:id">In a letter file the inline lemma text for an apparatus entry must be preceded by an anchor element whose id attribute matches the from attribute of the app element that follows the text.</sch:assert>
            <sch:assert id="letters-0002.16" test="matches(@xml:id, '^ap[0-9]{4}$')">The id attribute for the app element should be in the format a#####</sch:assert>
        </sch:rule>          
    </sch:pattern>
</sch:schema>