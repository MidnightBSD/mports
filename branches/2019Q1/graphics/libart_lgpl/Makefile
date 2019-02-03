# $MidnightBSD$

PORTNAME=	libart_lgpl
PORTVERSION=	2.3.21
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for high-performance 2D graphics

LICENSE=	lgpl

USES=		libtool pkgconfig pathfix tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

CONFLICTS=	libart-[0-9]*

post-install:
	${LN} -s libart_lgpl_2.so.2 ${PREFIX}/lib/libart_lgpl_2.so.5

.include <bsd.port.mk>
