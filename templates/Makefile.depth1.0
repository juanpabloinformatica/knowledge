PWD:=$(shell pwd)
SUBDIRS:=$(shell find ${PWD} -mindepth 1 -maxdepth 1 -type d \( '!' -path "*.git*" -and '!' -path "${PWD}" \)  )
$(info $(SUBDIRS))

NOTES:=notes.md

pdf: subdirs $(NOTES)
	sed -e '$$a\\\newpage' $(NOTES)
	pandoc -f gfm -o $(basename $(NOTES)).pdf -t pdf $(NOTES)

html: subdirs $(NOTES)
	sed -e '$$a\\\newpage' $(NOTES)
	pandoc -f gfm -o $(basename $(NOTES)).html -t html $(NOTES)

subdirs:$(SUBDIRS)
	echo "$(addsuffix /$(NOTES),$(SUBDIRS))"
	pandoc -s $(addsuffix /$(NOTES),$(SUBDIRS)) -o $(NOTES) ;\


$(SUBDIRS):
	$(MAKE) -C $@ $(type)

clean:
	echo "Removing *html and *pdf"
	find $(PWD) -type f '!' -path "*.git*" \( -name "*.html" -or -name "*.pdf" \) -delete


.PHONY: subdirs $(SUBDIRS) clean


