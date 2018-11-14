.PHONY: all

RMDS = $(shell find . -name "*.Rmd")
MDS = $(RMDS:.Rmd=.md)

%.md: %.html
	echo "---" > $@ && \
		cat "$(basename $<).Rmd" | fgrep '#?' | sed -re "s/#\?[ ]?*//g" >> $@ && \
		echo "---" >> $@ && \
		cat $< | grep -v DOCTYPE  >> $@

%.html: %.Rmd
	R --no-save -e 'rmarkdown::render("$<")'

all: $(MDS)
