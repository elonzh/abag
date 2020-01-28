# https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html
# https://linux.die.net/man/1/genisoimage
GENISOIMAGE := $(shell genisoimage -version 2>/dev/null)

ifdef GENISOIMAGE
	MKISOFS = genisoimage
else
	MKISOFS = mkisofs
endif

nocloud.iso: cidata/*
	$(MKISOFS) \
		-joliet -rock \
		-input-charset "utf-8" \
		-volid "cidata" \
		-graft-points \
		-root "/" \
		-output "nocloud.iso" \
		cidata
