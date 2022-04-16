PORTNAME=	gdl
PORTVERSION=	3.34.0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Components intended to be shared between GNOME development tools

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

USE_GNOME=	cairo gdkpixbuf2 gtk30 intltool introspection:build libxml2
USES=		gettext gmake gnome libtool localbase pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
