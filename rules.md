# COMMON

- An id element in the document must have a unique value. (Two or several rounds of random ID generation on diff elements  could miraculously make this fail I suppose)

- The top level TEI or TEI.2 element must have an ID or an xml:id attribute that must match an idno element of type 'LOCAL' in the PublicationStatement.

## TEIHeader context 
- The PublicationStatement must contain a date with type pub if the object has been published. The date must element must have a value attribute in the proper ISO date format.

- The PublicationStatement must contain a date with type sort. The date element must have a value attribute in the proper ISO date format.
```
*:teiHeader/*:fileDesc/*:publicationStmt/*:date[@type='sort']
```

- Every teiHeader must have a title within titleStmt within fileDesc
```
:teiHeader/*:fileDesc/*:titleStmt/*:title"
```
- A teiHeader element must contain an author element within titleStmt within fileDesc
```
teiHeader/*:fileDesc/*:titleStmt/*:author
```
- An object that has associated facsimiles must have, for each facsimile page rendered, a pb element that distinguishes the MS page division, with and id or xml:id, an n element and a rend attribute whose value is 'ms'

- A date element must have a type attribute and a value attribute; the value of the latter must be in ISO formst.

## body context
- A pb element may have a rend attribute whose value is one of 'silent' or 'ms' (The default, of no rend attribute refers to a page break in the source volume)

- A pb element must have an id or xml:id attribute, and an n attribute whose value is a sequential enumeration.

- A p element that is to have citation functionality must have an xml:id

- A p must have a rend attribute whose value is one of 'left', 'center', 'right', 'justify', 'indent', 'top', 'bottom', 'hang', 'blockindent', 'blockquote', 'block', 'noindent', 'inline', 'halfline', 'indentdateline', 'indentcompclose', 'indentsig', text-indent 'spaces', text-'hang', text-'blockindent', 'text-fullblockindent'

- A name element in the body must have a type attribute of either 'person', 'place', or 'title'

- If a name element in the body is of type 'person' or 'title' it must also contain a valid key attribute value

## PARTICULAR TO LETTERS, P4

### TEIHeader context

1. Every sourceDesc must contain a bibl element with an n attribute whose value is a description of the copy text.
```
*:bibl[@n='copy'][ancestor::*:sourceDesc]
```
### body context

1. Every letter body must contain a head element of type 'metadata

2. The head element of type 'metadata' must contain an addressee element enclosing one or more name elements; a date element, and a source element.

3. Every P4 file that embeds or points to another document must declare that document as an entity in the DTD for as long as we use P4

4. Every file that embeds or points to an image must declare that document as an entity in the DTD for as long as we use P4

5. Every letter body must contain a div1 type = letter with an id of lt0001

6. Every letter that encloses another short document must place the enclosure in a div1 of type enclosure  with an id = en####

7. If the enclosure is a very long letter it must be the target of, in P4, an xptr element of type 'crossref', with a doc attribute whose value is the file identifier. It should contain a rend attribute whose value is eithr 'embed' or 'new'

8. If an enclosure is a clipping it must be placed in a div2 element with an attribute of type 'clipping'

9. Every letter must contain a div1 with a type attribute whose value is 'commentary', and an id attribute matching xx####.

10. Every letter div1 of type 'commentary' may contain a div2 of type 'pub' with an id attribute matching pb#### (if there was a previous publication. ie query)

11. Every letter whose provenance is known must have a div2 element of type 'provenance' with an id attribute matching pv####. ie query 

12. Every new letter, if it has an envelope, must contain a div1 of type 'post-transmission' with an id attribute matching pt#### and a div2 of type 'envelope' with an id matching pt####

13. A block of text within a div of type 'post-transmission' must be emclosed in an ab element with a type attribute whose value is 'pt'

14. The text of a postmark must be placed in a hi element with the rend attribute xs-smallcaps, and the text must be rendered in lower cae.

15. In a letter file the inline lemma text for an apparatus entry must be preceded by an anchor element whose id attribute matches the from attribute of the app element that follows the text.

16. The id attribute for the app element should be in the format a#####

17. Every note element in the body must have a type value of one of 'ed', 'an', or 'au'

18. Every note element in the body of type 'an' or 'ed' must have an id attribute and a place attribute.

19. A note element of type 'an' must use the value 'inline' for the place attribute

20. A note element of type 'an' which contains editorial annotation must have a resp attribute with the value 'MTP'

21. A note element of type 'au' must have a resp attribute whose value is the key value for the name, i.e. the identifier bioXXXXX

22. A note element of type 'au' should most of the time contain at least one of a place attribute or an n attribute. ie query

23. A note element of type an must have an n attribute containing a sequential enumeration relative to other an notes.

24. A note element of type ed must use the value 'foot' for the place attribute

25. Every bibliographic citation, whether pointing to a repository or a secondary source, must use an xref element with a type attribute of 'dbquery', a from attribute whose value is the identifier of the keyed citation, and a rend attribute whose value is 'new'. 


## PARTICULAR TO WRITINGS, P5

- Every div in the body  must have an xml:id attribute and a type attribute, whose value is one of 'fmsec','edsec','chapter','bmsec'

- Every div must have two headers, one with no attribute; and one with a rend attribute having the value 'toc'.

- The table of contents consists of a series of p elements, each enclosing a ref element with a corresp attribute whose value is the xml:id of the keyed div1, and a type attribute whose value is 'chapterref'

- The table of illustrations must be in a list of type 'gloss' enclosing paried item and empty label elements.

- Each item in a table of illustrations must contain a ref element of type 'figref' along with an xml:id attribute and a corresp attribute whose value is keyed to teh identifier of the image, in the format 'xx#####'

- A figure element must have an xml:id attribute and a rend attribute whose value is one of FIND ME

- An app element must have an xml:id attribute,  a type attribute whose value is 'aet' and a from attribute whose value is in the format 'xx####', and whose value matches the value of the xml:id of the keyed preceding anchor of type 'aet'.

- A note element must have an xml:id of format 'xx####' and a place attribute whose value is one of 'inline' or 'foot'. 

- A note element containing editorial annotation must have a resp attribute whose value is 'MTP' and a type attribute whose value is "ed'. Its place attribute must have the value 'inline'

- A note element containing authorial annotation must have a resp attribute whose value is the keyed identifier of the name,  and a type attribute whose value is 'au'. Its place attribute must have the value 'foot'

