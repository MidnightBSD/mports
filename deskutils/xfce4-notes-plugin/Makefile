PORTNAME=	xfce4-notes-plugin
PORTVERSION=	1.10.0
PORTREVISION=	1
CATEGORIES=	deskutils xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Notes plugin for the Xfce panel
WWW=		https://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin

LICENSE=	gpl2

LIB_DEPENDS=	libunique-1.0.so:x11-toolkits/unique \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 gettext-tools gmake gnome libtool pkgconfig \
		tar:bzip2 xfce xorg
USE_GNOME=	cairo gdkpixbuf2 glib20 gtk30 intltool
USE_XFCE=	panel
USE_XORG=	ice sm x11

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

.include <bsd.port.mk>
