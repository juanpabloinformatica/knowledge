## Put this Makefle in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown file.
## -	Using `make` without arguments will generate html, tex, and pdf
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this.
## -	You can specify an output format with `make tex`, `make pdf` or
## - 	`make html`.
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

## Default to markdown extension (override on command line)
EXT?=md
## If the extension is not md lets pretend the md file exists! cos we'll build it.

## All markdown files in the working directory
SRC=$(wildcard *.$(EXT))

## File paths
PANDOC = $(HOME)/Uni/Templates/pandoc
TEMPLATES = $(PANDOC)/templates
CSL_PATH = $(HOME)/Uni/Citations/styles
BIB_PATH = $(HOME)/Uni/Citations/Library.bib
PREAMBLE = $(PANDOC)/templates/citeproc-preamble/hangingindent.latex
HTML_TEMPLATE = $(TEMPLATES)/default.html
REVEALJS_TEMPLATE = $(TEMPLATES)/default.revealjs
REVEALJS_SOURCE = $(HOME)/Uni/Templates/reveal.js

## Formats
REVEALJS=-t revealjs -V revealjs-url:$(REVEALJS_SOURCE) --standalone --slide-level 2
HIGHLIGHT_STYLE=--highlight-style=tango #$(shell sed '0,/---/d;/---/Q' $(SRC) | shyaml get-value highlight-style)
IN_FORMAT=-r markdown+simple_tables+grid_tables+table_captions+yaml_metadata_block
OUT_FORMAT=

## Filters
LATEX_ENGINE=--pdf-engine=xelatex
CITEPROC=--filter pandoc-citeproc --filter pandoc-citeproc-preamble -M citeproc-preamble=$(PREAMBLE)
CROSSREF=--filter pandoc-crossref
TABLES=--filter ~/.pandoc/filters/pandoc-wrapfig.py  --columns=80 --filter $(PANDOC)/filters/tables.py
CSV=--filter
MERMAID=--filter mermaid-filter

## Extract YAML variables for Latex

LATEX_TEMPLATE = $(TEMPLATES)/$(shell sed '0,/---/d;/---/Q' $(SRC) | shyaml get-value latex)
CSL=$(CSL_PATH)/$(shell sed '0,/---/d;/---/Q' $(SRC) | shyaml get-value csl).csl
BIB=$(CROSSREF) $(CITEPROC) --csl=$(CSL) --bibliography=$(BIB_PATH)
LATEX_OPTS= -s --template=$(LATEX_TEMPLATE) $(LATEX_ENGINE) $(MERMAID) $(BIB)
COMMON=--verbose $(HIGHLIGHT_STYLE)

## Filenames
PDF=$(SRC:.$(EXT)=.pdf)
HTML=$(SRC:.$(EXT)=.html)
TEX=$(SRC:.$(EXT)=.tex)
ODF=$(SRC:.$(EXT)=.odf)
DOC=$(SRC:.$(EXT)=.doc)

## Functions
setup: knit
all:	setup $(PDF) $(HTML) $(TEX) $(ODF) $(DOC)
pdf:	setup $(PDF)
html:	setup $(eval OUT_FORMAT=-w html) $(HTML)
tex:	setup $(eval OUT_FORMAT=-w latex) $(TEX)
odf:	setup $(ODF)
doc:	setup $(DOC)

clean:
	rm -f $(PDF) $(DOC) $(ODF) $(TEX) $(HTML)

%.html: %.md
	pandoc $(REVEALJS) $(MERMAID) $(BIB) --css custom.css --template=$(REVEALJS_TEMPLATE) -o $@ $<
	## pandoc $(COMMON) -s -S --template=$(HTML_TEMPLATE) --css=$(PANDOC)/marked/kultiad-serif.css -o $@ $<

%.pdf: %.md
	pandoc $(IN_FORMAT) $(COMMON) $(LATEX_OPTS) -o $@ $<

%.tex: %.md
	pandoc $(IN_FORMAT) $(COMMON) $(LATEX_OPTS) -o $@ $<

%.odf: %.md
	pandoc -o $@ $<

%.doc: %.md
	pandoc -o $@ $<

## Run knitr for Rmd files

knit:
ifeq ($(EXT), rmd)
	R --slave -e "library(knitr);knit('$(SRC)')"
endif

