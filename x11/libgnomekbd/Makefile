PORTNAME=	libgnomekbd
PORTVERSION=	3.26.1
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME keyboard shared library

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libxklavier.so:x11/libxklavier

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig \
		tar:xz xorg
USE_GNOME=	cairo gtk30 introspection:build
GNU_CONFIGURE=	yes
USE_XORG=	x11
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.libgnomekbd.desktop.gschema.xml \
		org.gnome.libgnomekbd.gschema.xml \
		org.gnome.libgnomekbd.keyboard.gschema.xml

.include <bsd.port.mk>
