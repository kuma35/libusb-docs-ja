#!/bin/sh
wget -k -np -w 3 -r -E -N --no-if-modified-since \
     http://libusb.sourceforge.io/api-1.0/index.html \
     http://libusb.sourceforge.io/api-1.0/pages.html \
     http://libusb.sourceforge.io/api-1.0/modules.html \
     http://libusb.sourceforge.io/api-1.0/annotated.html \
     http://libusb.sourceforge.io/api-1.0/classes.html \
     http://libusb.sourceforge.io/api-1.0/functions.html \
     http://libusb.sourceforge.io/api-1.0/files.html

