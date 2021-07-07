
SRC_DIR = source/libusb.sourceforge.io/api-1.0
PO_DIR = po
TARGET_DIR = target

SRC_ALL = $(wildcard $(SRC_DIR)/*)

SRC_HTML = $(filter %.html,$(SRC_ALL))
SRC_OTHER = $(filter-out %.html,$(SRC_ALL))

TARGET_HTML = $(addprefix $(TARGET_DIR)/,$(notdir $(SRC_HTML)))
TARGET_OTHER = $(addprefix $(TARGET_DIR)/,$(notdir $(SRC_OTHER)))

a_file = $(addsuffix $(3),$(addprefix $(1)/,$(notdir $(basename $(2)))))


.PHONY: all

html: $(TARGET_HTML) $(TARGET_OTHER)

# static pattern
$(TARGET_HTML): $(TARGET_DIR)/%.html : $(PO_DIR)/%.html.po
	po4a-translate -v --format xhtml --master $(call a_file,$(SRC_DIR),$@,.html) --master-charset UTF-8 --po $? --localized $(call a_file,$(TARGET_DIR),$@,.html) --localized-charset UTF-8

$(TARGET_OTHER): $(TARGET_DIR)/% : $(SRC_DIR)/%
	cp -v -u $? $@
