NOTE:

In order for xspec/bin/xspec.sh to work, I had to explicitly reference location of saxon jars:

```
else
    echo Saxon script not found, invoking JVM directly instead.
    echo
    xslt() {
#        java -cp "$CP" net.sf.saxon.Transform "$@"
         java -cp /c/Users/thc4/SaxonHE9-7-0-20J/saxon9he.jar net.sf.saxon.Transform "$@"
    }
    xquery() {
#        java -cp "$CP" net.sf.saxon.Query "$@"

         java -cp /c/Users/thc4/SaxonHE9-7-0-20J/saxon9he.jar net.sf.saxon.Query "$@"
    }
fi

```

with this set run

```
$ ./xspec/bin/xspec.sh -s -j test/mtpo-general.xspec

```