BUILD = build
BOOKNAME = fieldguide
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS = ch01.md ch02.md ch03.md ch04.md ch05.md ch06.md
TOC = --toc --toc-depth=2
COVER_IMAGE = img/cover.png
LATEX_CLASS = report
CLEVEL = --epub-chapter-level=2
CSS = --epub-stylesheet=epub.css

all: book

book: epub

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) $(CSS) $(CLEVEL) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

.PHONY: all book clean epub
