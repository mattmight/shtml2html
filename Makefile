

shtml2html: shtml2html.rkt
	raco exe shtml2html.rkt

.PHONY: install
install: shtml2html
	cp -v shtml2html ~/bin/
	

.PHONY: clean
clean:
	rm -fv shtml2html
