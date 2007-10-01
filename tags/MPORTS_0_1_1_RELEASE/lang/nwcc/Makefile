# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.5 2007/08/22 04:03:45 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.3
PORTREVISION=	3
CATEGORIES=	lang
DISTFILES=	nwcc_0.7.3.tar.gz
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	A BSD-licensed C-compiler.
LICENSE=	bsd2

CONFLICTS=	nwcc-devel-*

WRKSRC=		work/nwcc_0.7.3
HAS_CONFIGURE=	yes
ALL_TARGET=	nwcc

.include <bsd.port.pre.mk>

.if ${ARCH} != i386
BUILD_DEPENDS= ${LOCALBASE}/bin/yasm:${PORTSDIR}/devel/yasm
.else
BUILD_DEPENDS=  ${LOCALBASE}/bin/nasm:${PORTSDIR}/devel/nasm
.endif
RUN_DEPENDS= ${BUILD_DEPENDS}

post-install:
	${CP} -n ${WRKSRC}/nwcc.conf.sample ${PREFIX}/etc/nwcc.conf.sample

.include <bsd.port.post.mk>
