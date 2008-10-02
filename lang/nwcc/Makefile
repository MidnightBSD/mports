# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.11 2008/08/17 16:24:39 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.6
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nils Weller's BSD-licensed C-compiler
LICENSE=	bsd2

HAS_CONFIGURE=	yes
ALL_TARGET=	nwcc

.include <bsd.port.pre.mk>

post-install:
	${CP} -n ${WRKSRC}/nwcc.conf.sample ${PREFIX}/etc/nwcc.conf.sample

.include <bsd.port.post.mk>
