.PHONY: all clean
.SUFFIXES:

SRC_DIR:=src
DST_DIR:=build

HTML_SRC:=$(shell find $(SRC_DIR) -type f -name '*.html')
IMG_SRC:=$(shell find $(SRC_DIR) -type f -iname '*.jpg' -o -iname '*.png' -o -iname '*.webp')
CSS_SRC:=$(shell find $(SRC_DIR) -type f -name '*.css')
ALL_SRC:=$(HTML_SRC) $(CSS_SRC) $(IMG_SRC)

all: $(patsubst $(SRC_DIR)/%,$(DST_DIR)/%,$(ALL_SRC)) ;

$(DST_DIR)/%.html: $(SRC_DIR)/%.html Makefile wrap_page.sh
	bash ./wrap_page.sh $< > $@

$(DST_DIR)/%: $(SRC_DIR)/%
	cp $< $@

clean:
	rm -rf $(DST_DIR)/*


