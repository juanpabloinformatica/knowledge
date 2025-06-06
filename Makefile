PWD:=$(shell pwd)
SUBDIRS:=$(shell find ${PWD} -mindepth 1 -maxdepth 1 -type d \( '!' -path "*.git*" -and '!' -path "${PWD}" -and '!' -path "*scripts*" -and '!' -path "*templates*" -and '!' -path "*pandocOptions*"  \)  )
$(info $(SUBDIRS))
NOTES_HTML:=notes.html
NOTES_PDF:=notes.pdf
NOTES_MD:=notes.md
KNOWLEDGE:=knowledge


pdf: type:=pdf

pdf: subdirs

html: type:=html

html: subdirs

subdirs:$(SUBDIRS)

	if [[ $(type) == "pdf" ]];then \
		echo "$(type)==pdf"; \
		pandoc $(addsuffix /$(NOTES_MD),$(SUBDIRS)) \
    -H ./pandocOptions/chapter_break.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --toc \
    -o $(KNOWLEDGE).pdf;\
	else \
		echo "$(type)==html"; \
		pandoc -s $(addsuffix /$(NOTES_HTML),$(SUBDIRS)) -f html -o $(KNOWLEDGE).html; \
	fi

$(SUBDIRS):
	$(MAKE) -C $@ $(type)

clean:
	echo "Removing *html and *pdf"
	find $(PWD) -type f '!' -path "*.git*" \( -name "*.html" -or -name "*.pdf" \) -delete


.PHONY: subdirs $(SUBDIRS) clean


