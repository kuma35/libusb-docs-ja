
# SRC_DIR = source/libusb.sourceforge.io/api-1.0
SRC_DIR = source/api-1.0
PO_DIR = po
TARGET_DIR = docs

SRC_ALL = $(wildcard $(SRC_DIR)/*)

SRC_HTML = $(filter %.html,$(SRC_ALL))
SRC_OTHER = $(filter-out %.html,$(SRC_ALL))

PO_PO = $(wildcard $(PO_DIR)/*.html.po)

TARGET_HTML = $(addprefix $(TARGET_DIR)/,$(notdir $(SRC_HTML)))
TARGET_OTHER = $(addprefix $(TARGET_DIR)/,$(notdir $(SRC_OTHER)))

a_file = $(addsuffix $(3),$(addprefix $(1)/,$(notdir $(basename $(2)))))


html: $(TARGET_HTML) $(TARGET_OTHER)

updatepo: $(PO_PO)

# static pattern
$(TARGET_HTML): $(TARGET_DIR)/%.html : $(PO_DIR)/%.html.po
	po4a-translate -v --format xhtml --master $(call a_file,$(SRC_DIR),$@,.html) --master-charset UTF-8 --po $? --localized $(call a_file,$(TARGET_DIR),$@,.html) --localized-charset UTF-8 --keep 0

$(TARGET_OTHER): $(TARGET_DIR)/% : $(SRC_DIR)/%
	cp -v -u $? $@

$(PO_PO): $(PO_DIR)/%.html.po : $(SRC_DIR)/%.html
	po4a-updatepo --format xhtml --master $? --master-charset UTF-8 --previous --copyright-holder "libusb" --package-name "libusb" --package-version "1.0" --po $@


.PHONY: html updatepo
