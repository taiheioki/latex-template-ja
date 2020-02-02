#!/usr/bin/env make -f

LATEXMK = latexmk
MAKE = make
TARGET = main
ARXIV = arxiv

.PHONY: all pvc arxiv clean FORCE

all: $(TARGET).pdf

%.pdf: %.tex FORCE
	$(LATEXMK) $(LATEXMKFLAG) $<

pvc:
	LATEXMKFLAG+=-pvc $(MAKE)

arxiv: $(ARXIV).zip

$(ARXIV).zip: all
	rm -f $@
	awk '/^\["(pdf)?latex"\]/,/^  \(generated\)$$/' $(TARGET).fdb_latexmk |\
	awk -F '"' '$$2~/^[^\/]/ && $$4~/^(bibtex $(TARGET))?$$/ {print $$2}' |\
	xargs zip -j $@

clean:
	$(LATEXMK) -C $(TARGET)
	rm -f $(ARXIV).zip
