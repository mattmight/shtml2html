
# shtml2html

`shtml2html` is a Racket script for converting basic .shtml files
into .html files.

It understands only directives of the form:

```
<!--#include file="<filename>" -->
```

## Installation

To build, run `make`.

To install to `~/bin/`, run `make install`.


## Usage

To use, send a shtml file to stdin:

    shtml2html < <file>.shtml > file.html


