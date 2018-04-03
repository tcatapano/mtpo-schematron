# Schematron Rules for METS

## Common Rules

### dmdSec Context

- A METS object must contain at leat one dmdSec.

- A METS object must contain within this dmdSec one mdWrap whose MDTYPE attibute is 'MODS'

- A METS object must contain at least one structMap.

- A METS object that points to a digital object must contain one fileSec with at least one fileGrp.


### mods Context

- The top-level mods ID attribute must be unique and in the format 'dbid#####', corresponding to the DBID of the related DB record.

- A mods object must have a titleInfo element with a type attr whose value is 'uniform', and a displayLabel attr whose value must not contain an ampersand.

- A mods object must contain a typeOfResource element whose value is one of 'text', 'manuscript' or 'still image'.
```
//mods:mods/mods:identifier[@type='local']
```
- A mods object must contain an identifier with a type attr whose value is 'local'

```
//mods:mods/mods:originInfo/mods:dateCreated 

```
- A mods object must contain at least one of the set: dateCreated, dateIssued, or  dateOther.

```
//mods:note[@type='category']

```

- A mods object must contain a note element with a type attr whose value is 'category'.

```
//mods:physicalLocation/@displayLabel
```

- A mods object for a work with an archival source must contan a physicalLocation element whose displayLabel attribute value consists of the shortRef equivalent of the full repository name which appears as the text() value of the element.

```
//mods:mods/mods:relatedItem[@type='original']/mods:titleInfo[@displayLabel]"

```

- A mods object for a published source must have a titleInfo element with a displayLabel attr.

```
//mods:mods/mods:relatedItem[@type='host']
```

- A METS object that points to an xml text must contain a relatedItem element of type 'host' describing the parent volume of the document.

```
//mods:mods/mods:relatedItem[@type='constituent'][matches(@displayLabel,'^bib')
```

- A METS object that will provide cross references for the internal reflist interface must contain, in the case of published volumes, a relatedItem of type 'constituent' with a displayLabel attr whose value matches '^bib'. (This functionality could be pushed to prod sometime)


### fileSec Context

```
//mets:fileGrp/mets:file[@USE='text'][1]/mets:F
```

- Locat[@LOCTYPE='URL']/@xlink:href
A METS object that points to a TEI file must contain a fileGrp element with a USE attr whose value is 'text'.

- A METS object that points to one or more facsimile files must contain a fileGrp element containing one or more file lements with a USE attr whose value is 'facsimile'.

- A METS object that points to an image file to be displayed in the Image interface must contain a fileGrp element with an attr USE whose value is 'image'.

- A fileGrp pointing to an image file to be displayed in the Image interface must contain a file element with attr USE whose value is 'reference'.

- A file element with attr USE whose value is 'reference' must contain a FLocat element with an xlink:href that points to an image filename.

- A file element with attr USE whose value is 'reference' must contain a FLocat element with an xlink:title that consists of a short text title.
```
//mods:mods/mods:identifier[@type='digObj']
```
- A mods object that points to a TEI fileor an image surrogate must contain an identifier of attr type 'digObj' whose value matches the identifier (not the filename) of the digital object to be displayed. (This will not match the db identifier in many cases (so don't make that rule. In the case if an embedded or enclosed letter, the parent's identifier whould appear here).

### structMap Context

- A structMap must have an attr ORDER, whose value is in the format ``#####``, determining the overall sort order (over all objects) in all query interfaces, and esp in the cross-collection interface.


### Letters

```
//mods:mods/mods:titleInfo[@displayLabel='Cue']/mods:title
```
- A METS object for an outgoing letter should contain a titleInfo with a displayLabel attr whose value is 'Cue' and whose child title value is a short text snippet.

```
//mods:mods/mods:titleInfo[@displayLabel='Abbreviated']/mods:title
```

- A METS object for an outgoing letter should contain a titleInfo with attr displayLabel whose value is 'Abbreviated' and whose child title value is a short text snippet.

```
//mods:mods/mods:titleInfo[@displayLabel='Hyperabbreviated']/mods:title
```

- A METS object for an outgoing letter should contain a titleInfo with attr displayLabel whose value is 'Hyperabbreviated' and whose child title value is a short text snippet.

- A letter METS object must contain at least one name element with a child roleTerm whose value is 'writer'

- A letter METS object must contain at least one name element with a child roleTerm whose value is 'addressee'

- A name element must contain an ID attr whose value is a valid identifier keyed to a name authority record.

- A name element must contain an xlink:href attr whose value is an xml filename.

- A name element must contain a displayLabel attr whose value is the keyed name in last name, first name order.

- A letter METS object must contain a physDescription element with two child form ekements: one wiht a type attr whose value is 'doctype' and one with a type attr whose value is 'objType'.

```
//mods:mods/mods:physicalDescription/mods:form[@type='doctype']
```
- A letter object must contain a form element with an aatr type whose value is 'doctype'. (This is for the genreformat: ALs, postal card etc)

- A letter must contain at least one relatedItem element with a type attr whose value is 'original'.

- A letter object must contain a dateCreated element in ISO format

- A letter mods must contain a dateOther element of type 'datePrime' whose value is a text rendering of the ISO date according to house style.

```
//mods:mods/mods:subject/mods:geographic"
```

- A letter mods must contain a subject element with a child geographic element whose value is either 'Unknown place' or a valid geogname.


- In a letter object a relatedItem of type - 'original' must contain a physicalDescription element whit two child form elements.
```
//mods:mods//mods:relatedItem/mods:location/mods:physicalLocation
```

- A relatedItem of attr type 'original' must contain at least one of titleInfo or physicalLocation (i.e. for a print or archival source).

- In a relatedItem of type 'original' the titleInfo element, if it exists, must have an attr displayLabel

### fileSec Context

- If a letter was published in an L# volume, the file element must have an attr SEQ whose value is the secondary sibsequence of the letter that volume

## Writings

```
//mods:mods/mods:name[mods:role/mods:roleTerm='author']/mods:namePart
```

- A mods object for a literary work must have at least one author. Make the above a match.

```
//mods:mods/mods:note[@type='Imprint Info']"
```
- A mods object for a litery work whose resourceType is 'text' must have a note elements with a type attr whose value of 'Imprint Info'

```
//mods:mods//mods:note[@type='MTP Edition']
```

- A mods object for a literary work published by MTP must contain a note element with a type attr whose value is 'MTP Edition'.

- The value of the MTP edition element should consist of the abbreviated (sortRef) form of the title of the MTP edition, e.g. ET&S1, followed by pagination.


## Images

```
//mods:mods//mods:physicalDescription/mods:form[@type='doctype']
```
- A mods object for an image must hava e physicalDescription element containing a form element of attr 'type' whose value is 'doctype'.

```
//mods:mods/mods:name[mods:role/mods:roleTerm='primary artist']/mods:namePart
```
- A mods object for an image must have a creator designated the 'primary artist', even if the value is 'Unidentified'.

```//mets:fileGrp/mets:file[@USE='facsimile']
```
or
```
//mets:fileGrp/mets:file[@USE='image_notPub']
```
- If an image METS object points to a digital surrogate, and the holding repository or source of the image is not CU-MARK then the file USE attr must be 'image_notPublic'

```
//mets:fileGrp/mets:file[@USE='reference']
```
- If an image  METS object points to a digital image, and the holding repository or source of the image is CU-MARK then the file USE attr must be 'reference'


## Special Rules for Production Files

### Letters

- A METS object that points to a TEI text must have a dmdSec containing an mdRef whose xlink:href refers to a valid parent volume parent.

- A METS object that points to a TEI text must have a dmdSec containing an mdRef with a label attr whose value consists of a short title for the parent volume.


### MTDP00000 file (the Reflist)

```
//mods:relatedItem[@type='constituent'][@displayLabel='bib#####'
```

- Each bibliographic object in the reflist file must be in a relatedIem element with a type attr whose value is 'constituent', and whose displayLabel att has a value in the format ``bib####``.

```
//mods:relatedItem[@type='constituent'][@displayLabel='bib#####']/mods:note[@type='bibliographicCitation'][@displayLabel]
```
- The citation for a bibliographic object must be in a note with a type attr whose value is 'bibliographicCitation'.

### Letter Volume Files (MTDP00217-00223)
```
//mods:note type="BibCit"
```
- A METS object for a letter volume must contain an mods record with a note of sttr 'type' whose value is 'BibCit'.

```
//mets:structMap/mets:div[@TYPE='Year'][@LABEL='####'][@ID]
```

- The structMap for a  METS object for a letter volume must contain, for every year represented by the volume, a div element  of attr 'TYPE' whose value is 'Year' and an attr LABEL whose value is a year in the format ####.

```
//mets:mptr[@ID='SEQ_####'][@LOCTYPE='URL'][@xlink:href='UCCL09883.mets.xml'][@xlink:role='part'][@xlink:title]
```
- The parent METS file for a volume of letters must contain in its structMap a list of divs, one for each year, within which is mustered a list of letters, each in an mptr with an ID attr whose value is in the format 'SEQ_####'.

```
//mets:mptr[@LOCTYPE='URL'][@xlink:href='UCCL09883.mets.xml']
```
- An mptr pointing to a letter constituent must have an attr LOCTYPE whose value is 'URL' and an attribute xlink:href whoe value is the mets file for the letter.

//mets:mptr[@xlink:title]

An mptr pointing to a letter constituent must have an attr xlink:title whose value is the Abbreviated Title value for the letter.
