##############################################################################
#
# rt2880_app 
#
################################################################################

RT2880_APP_VERSION = be1221108d5185ef47a552a50917dd817a6a2f3d 
RT2880_APP_SITE = $(call github,gwsys,rt2880_app,$(RT2880_APP_VERSION)) 
RT2880_APP_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="-L$(STAGING_DIR)/usr/lib" KERNEL_DIR="$(LINUX_DIR)"
RT2880_APP_DEPENDENCIES += linux

define RT2880_APP_BUILD_CMDS 
	$(MAKE) $(RT2880_APP_MAKE_OPTS) -C $(@D)	
endef

define RT2880_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/switch/switch  $(TARGET_DIR)/usr/local/sbin/switch
	$(INSTALL) -D -m 0755 $(@D)/switch/config-vlan.sh  $(TARGET_DIR)/usr/local/sbin/config-vlan.sh
#	$(INSTALL) -D -m 0755 $(@D)/reg/reg  $(TARGET_DIR)/usr/local/sbin/reg
endef

define RT2880_APP_UNINSTALL_TARGET_CMDS
        rm -f $(TARGET_DIR)/usr/local/sbin/switch
        rm -f $(TARGET_DIR)/usr/local/sbin/config-vlan.sh
#        rm -f $(TARGET_DIR)/usr/local/sbin/reg
endef

define RT2880_APP_CLEAN_CMDS 
	$(MAKE) -C $(@D) clean
endef

$(eval $(generic-package))
