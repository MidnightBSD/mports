PORTNAME=	libmatekbd
PORTVERSION=	1.28.0
PORTREVISION=	1
CATEGORIES=	x11 mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MATE keyboard shared library
WWW=		https://mate-desktop.org/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libxklavier.so:x11/libxklavier

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome libtool localbase pathfix \
		pkgconfig tar:xz xorg
USE_GNOME=	cairo gtk30 intltool introspection:build
USE_XORG=	x11
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.mate.peripherals-keyboard-xkb.gschema.xml

.include <bsd.port.mk>
