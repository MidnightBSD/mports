PORTNAME=	xfce4-mailwatch-plugin
PORTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	mail xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail notification applet for the Xfce panel

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgnutls.so:security/gnutls \
		libgpg-error.so:security/libgpg-error \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USES=		compiler:c11 gettext-tools gmake gnome libtool pkgconfig \
		tar:bzip2 xfce xorg
USE_GNOME=	cairo glib20 gtk30 intltool
USE_XFCE=	panel
USE_XORG=	x11

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		IPV6 NLS
OPTIONS_SUB=		yes

IPV6_CONFIGURE_ENABLE=	ipv6

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

post-patch:
	${REINPLACE_CMD} -e 's|xfce-mail|mail-send|' \
		${WRKSRC}/panel-plugin/mailwatch-plugin.c

.include <bsd.port.mk>
