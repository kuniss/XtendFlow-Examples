# XtendFlow-Examples
This projects collects arbitrary Examples implemented with the Xtend DSL 
[XtendFlow](https://github.com/kuniss/XtendFlow).

Currently only one example has been implemented - [ConvertRoman](https://github.com/kuniss/XtendFlow-Examples/tree/master/ConvertRoman).

## [CovertRoman](https://github.com/kuniss/XtendFlow-Examples/tree/master/ConvertRoman)

This example implements a conversion from and to roman numerals. It implements closely the design described in Ralf Westpahl's [article "IODA Architecture by Example"](http://geekswithblogs.net/theArchitectsNapkin/archive/2015/05/02/ioda-architecture-by-example.aspx) making this implementation comparable to the C# based implementation made by him and within better comprehensible.

As an example how close the XtendFlow implementation follows the design diagrams check the following flow chart:

![FlowChart](https://gwb.blob.core.windows.net/thearchitectsnapkin/Windows-Live-Writer/df23fce65724_C742/image_15.png)

In XtendFlow this is directly mapped to the following flow specification implemented at the constructor of the [function unit class *Body*](https://github.com/kuniss/XtendFlow-Examples/blob/master/ConvertRoman/src/de/grammarcraft/xtend/flow/examples/convertroman/integration/body/Body.xtend):

![de.grammarcraft.xtend.flow.examples.convertroman.integration.body.Body.xtend](http://blog.grammarcraft.de/wp-content/uploads/2015/10/Body-XtendFlow-Flow-Declarations.jpg)

Who is able to read German, may read [my more detailed blog article](http://blog.grammarcraft.de/2015/11/02/alle-wege-fuehren-nach-rom-ioda-architektur-mit-xtendflow-am-beispiel/) about the implementation.
