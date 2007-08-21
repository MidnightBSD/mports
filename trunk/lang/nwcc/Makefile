# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD$
#

PORTNAME=	nwcc
PORTVERSION=	0.7.3
CATEGORIES=	lang
DISTFILES=	nwcc_0.7.3.tar.gz
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	A BSD-licensed C-compiler.

WRKSRC=		work/nwcc_0.7.3
HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=	--installprefix=${FAKE_DESTDIR}${PREFIX}
ALL_TARGET=	nwcc

.include <bsd.port.mk>
