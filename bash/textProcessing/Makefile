# FILES=$(shell find -type f -maxdepth 1 -name "*.md")
NOTES:=notes.md
$(info pandoc -f gfm -o $(basename $(NOTES)).pdf -t pdf)

html: $(NOTES)
	pandoc -f gfm -o $(basename $(NOTES)).html -t html $(NOTES)

pdf: $(NOTES)
	pandoc -f gfm -o $(basename $(NOTES)).pdf -t pdf $(NOTES)







