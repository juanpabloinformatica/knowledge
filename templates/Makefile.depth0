PWD:=$(shell pwd)
SUBDIRS:=$(shell find ${PWD} -mindepth 1 -maxdepth 1 -type d \( '!' -path "*.git*" -and '!' -path "${PWD}" -and '!' -path "*scripts*" \)  )
$(info $(SUBDIRS))
NOTES_HTML:=notes.html
NOTES_PDF:=notes.pdf
KNOWLEDGE:=knowledge


pdf: type:=pdf

pdf: subdirs

html: type:=html

html: subdirs

subdirs:$(SUBDIRS)

	if [[ $(type) == "pdf" ]];then \
		echo "$(type)==pdf"; \
		pandoc $(addsuffix /$(NOTES_HTML),$(SUBDIRS)) -o $(KNOWLEDGE).pdf;\
	else \
		echo "$(type)==html"; \
		pandoc -s $(addsuffix /$(NOTES_HTML),$(SUBDIRS)) -o $(KNOWLEDGE).html; \
	fi

$(SUBDIRS):
	$(MAKE) -C $@ $(type)

clean: 
	echo "Removing *html and *pdf"
	find $(PWD) -type f '!' -path "*.git*" \( -name "*.html" -or -name "*.pdf" \) -delete
	

.PHONY: subdirs $(SUBDIRS) clean


