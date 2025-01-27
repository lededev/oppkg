#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lzlib
PKG_VERSION:=1.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/lzip/$(PKG_NAME)
PKG_HASH:=5acac8714ed4f306020bae660dddce706e5f8a795863679037da9fe6bf4dcf6f
PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/lzlib
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=compression and decompression functions for lzip format
	URL:=https://www.nongnu.org/lzip/lzlib.html
	ABI_VERSION:=0
endef

define Package/lzlib/description
 Lzlib is a data compression library providing in-memory LZMA compression and decompression functions, including integrity checking of the decompressed data.
 The compressed data format used by the library is the lzip format.
endef

define Package/lzlib/install
	$(INSTALL_DIR) $(1)/tmp
	touch $(1)/tmp/.lzlib-placeholder
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lzlib.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/liblz.a $(1)/usr/lib/
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/include
	$(INSTALL_DATA) $(HOST_BUILD_DIR)/lzlib.h $(STAGING_DIR_HOSTPKG)/include
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/lib
	$(INSTALL_DATA) $(HOST_BUILD_DIR)/liblz.a $(STAGING_DIR_HOSTPKG)/lib
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,lzlib))
