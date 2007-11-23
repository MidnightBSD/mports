# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.7 2007/10/25 00:18:20 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.4
CATEGORIES=	lang
DISTFILES=	nwcc_0.7.4.tar.gz
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A BSD-licensed C-compiler.
LICENSE=	bsd2

WRKSRC=		${WRKDIR}/nwcc_0.7.4
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
