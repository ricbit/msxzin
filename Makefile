# msxzin.com: the MSX emulator, packed into a self-extracting DOS .COM.
#
# Needs namagiri; point NAMAGIRI at it if it is not on the PATH:
#   make NAMAGIRI=../namagiri/namagiri

NAMAGIRI ?= namagiri

all: msxzin.com

msxzin.com: msxzin.ng debug.ng selfext.ng
	$(NAMAGIRI) msxzin.ng -DPACK --stub=selfext.ng --entry=boot -o $@

clean:
	rm -f msxzin.com

.PHONY: all clean
