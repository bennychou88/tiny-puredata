################################################################################
#
# puredata
#
################################################################################

PUREDATA_VERSION =  0.50-2
PUREDATA_SITE = $(call github,pure-data,pure-data,$(PUREDATA_VERSION))

#PUREDATA_SOURCE = pd-$(PUREDATA_VERSION).src.tar.gz
#PUREDATA_SITE = http://msp.ucsd.edu/Software
PUREDATA_INSTALL_STAGING = YES
PUREDATA_INSTALL_TARGET = YES
PUREDATA_AUTORECONF = YES 
PUREDATA_CONF_OPTS = --disable-portaudio --disable-portmidi --no-recursion

PUREDATA_DEPENDENCIES = alsa-utils tcl tk

define PUREDATA_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
PUREDATA_PRE_CONFIGURE_HOOKS += PUREDATA_RUN_AUTOGEN

define PUREDATA_BINARY_SYMLINK
        ln -sf /usr/bin/pd $(TARGET_DIR)/usr/lib/pd/bin/pd
endef
PUREDATA_POST_INSTALL_TARGET_HOOKS += PUREDATA_BINARY_SYMLINK

$(eval $(autotools-package))
