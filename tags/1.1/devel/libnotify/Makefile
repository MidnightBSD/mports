# $MidnightBSD$

PORTNAME=	libnotify
PORTVERSION=	0.7.7
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for desktop notifications

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	intlhack glib20 gdkpixbuf2 introspection
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--disable-tests

.include <bsd.port.mk>
