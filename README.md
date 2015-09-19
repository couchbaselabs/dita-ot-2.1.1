#DITA-OT 2.1.1 for Couchbase
This is a version of the DITA open toolkit customized for Couchbase documentation. It is easier to use than previous versions.

You need to have Java installed on your machine (both JDK and JRE).

To use it, just clone this repo onto your machine and it is ready to use. I put it in my /Applications directory.

Here's an example of how to build a DITA document. Substitute your particular file names and locations. 

The options on the command are:
* -f is the format to create
* -i is the input .ditamap file to use
* -o is where to put the output

This command will give you a basic HTML document, with navigation in an index.html file.
```
$ cd /Applications/dita-ot-2.1.1
$ ./bin/dita -f html5 -i /users/amy/repos/docs/developer/developer.ditamap -o /Library/WebServer/Documents/developer
```

If you like the format on the old site, you can try this variation of the command:

```
$ cd /Applications/dita-ot-2.1.1
$ ./bin/dita -f com.couchbase.docs.html-draft -i /users/amy/repos/docs/developer/developer.ditamap -o /Library/WebServer/Documents/developer
```




