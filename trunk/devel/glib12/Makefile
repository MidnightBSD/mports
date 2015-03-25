# $MidnightBSD$

PORTNAME=	glib
PORTVERSION=	1.2.10
PORTREVISION=	15
CATEGORIES=	devel
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	12

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (previous stable version)

LICENSE=	lgpl

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool pathfix
USE_CSTD=	gnu89
USE_LDCONFIG=	yes

INFO=		glib

post-install:
	${LN} -sf glib-config ${PREFIX}/bin/glib12-config

.include <bsd.port.mk>
