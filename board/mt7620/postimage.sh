#!/bin/sh

lzma -z -9 -k -f $BINARIES_DIR/vmlinux.bin 
mkimage -A mips -O linux -C lzma  -a 0x80000000 -e 0x8000c1d0 -n "wifi system" -d $BINARIES_DIR/vmlinux.bin.lzma  $BINARIES_DIR/uImage 
