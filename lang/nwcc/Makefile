# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.8 2007/11/23 19:57:18 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.4
PORTREVISION=	1
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

post-install:
	${CP} -n ${WRKSRC}/nwcc.conf.sample ${PREFIX}/etc/nwcc.conf.sample

.include <bsd.port.post.mk>
