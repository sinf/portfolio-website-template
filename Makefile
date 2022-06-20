.PHONY: all clean
.SUFFIXES:

SRC_DIR:=src
DST_DIR:=build

HTML_SRC:=$(shell find $(SRC_DIR) -type f -name '*.html')
HTML_DST:=$(patsubst src/%,$(DST_DIR)/%,$(HTML_SRC))

all: $(HTML_DST) ;

$(DST_DIR)/%.html: $(SRC_DIR)/%.html Makefile wrap_page.sh
	bash ./wrap_page.sh $< > $@

clean:
	rm -rf $(DST_DIR)/*


