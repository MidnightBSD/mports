PORTNAME=	xorg-macros
PORTVERSION=	1.19.2
CATEGORIES=	devel x11
DISTNAME=	util-macros-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org development aclocal macros

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg-cat:util

MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"

PLIST_FILES=	share/aclocal/xorg-macros.m4 \
		libdata/pkgconfig/xorg-macros.pc \
		share/util-macros/INSTALL

.include <bsd.port.mk>
