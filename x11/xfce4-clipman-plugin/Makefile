PORTNAME=	xfce4-clipman-plugin
PORTVERSION=	1.6.6
PORTREVISION=	1
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clipboard manager for the Xfce panel
WWW=		https://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin

LICENSE=	gpl2

LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 gettext-tools gmake gnome libtool pkgconfig \
		tar:bzip2 xfce xorg
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 intltool
USE_XFCE=	libmenu panel xfconf
USE_XORG=	ice sm x11 xorgproto xtst

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-wayland
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		NLS QRCODE
OPTIONS_SUB=		yes

QRCODE_DESC=		QR Code support

NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

QRCODE_LIB_DEPENDS=	libqrencode.so:graphics/libqrencode
QRCODE_CONFIGURE_ENABLE=libqrencode

.include <bsd.port.mk>
