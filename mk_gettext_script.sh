#!/bin/sh
find ./source/libusb.sourceforge.io/api-1.0/ -name "*.html" -printf "po4a-gettextize --format xhtml --master %p --master-charset utf-8 --copyright-holder \"libusb\" --package-name \"libusb\" --package-version \"0.0\" --po ./po/%f.po\n"
