################################################################################
#
# ubus 
#
################################################################################

UBUS_VERSION = 33e3d8cea2b84cedc0c0b0584690326ea7d00ac5 
#UBUS_SOURCE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION)) 
UBUS_SITE = $(call github,gwsys,ubus,$(UBUS_VERSION)) 
#UBUS_SITE_METHOD = local

#UBUS_DEPENDENCIES = libubox 
UBUS_INSTALL_STAGING = YES

define UBUS_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define UBUS_INSTALL_STAGING_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install-staging
endef

define UBUS_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

define UBUS_UNINSTALL_STAGING_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall-staging
endef

define UBUS_UNINSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
endef

define UBUS_CLEAN_CMDS
        $(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
