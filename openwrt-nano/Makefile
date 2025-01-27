#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_VERSION:=8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/nano
PKG_HASH:=d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Jonathan Bennett <JBennett@incomsystems.biz>, Hannu Nyman <hannu.nyman@iki.fi>
PKG_CPE_ID:=cpe:/a:gnu:nano

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/nano-c
  SUBMENU:=Editors
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=An enhanced clone of the Pico text editor
  URL:=https://www.nano-editor.org/
  DEPENDS:=+libncurses +zlib +libmagic
endef

define Package/nano-c/description
  Nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone
  of the Pico text editor, color highlight enabled.
endef

CONFIGURE_ARGS += \
        --enable-help \
        --enable-linenumbers \
        --enable-multibuffer \
        --enable-utf8 \
        --enable-color \
        --enable-nanorc \
        --without-slang \
        --disable-option-checking \
        --disable-dependency-tracking \
        --disable-nls \
        --disable-operatingdir \
        --disable-browser \
        --disable-justify \
        --disable-mouse \
        --disable-speller \
        --disable-extra \
        --disable-tabcomp \
        --disable-wordcomp

CONFIGURE_VARS += \
	ac_cv_header_regex_h=no \

define Package/nano-c/conffiles
/etc/nanorc
endef

define Package/nano-c/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc $(1)/usr/share/nano
	$(INSTALL_DATA) ./files/nanorc $(1)/etc/nanorc
	$(INSTALL_DATA) ./files/uci.nanorc $(1)/usr/share/nano
	$(CP) $(PKG_INSTALL_DIR)/usr/share/nano/* $(1)/usr/share/nano
endef

$(eval $(call BuildPackage,nano-c))

