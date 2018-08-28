# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD$
#

PORTNAME=	nwcc
PORTVERSION=	0.8.3
CATEGORIES=	lang
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}%20${PORTVERSION}
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nils Weller's BSD-licensed C-compiler

LICENSE=	bsd2

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--installprefix=${PREFIX}
ALL_TARGET=

post-build:
	cd ${WRKSRC} ; ${MAKE} test

.include <bsd.port.mk>
