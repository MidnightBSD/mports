# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.13 2009/07/07 22:25:22 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.9
CATEGORIES=	lang
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}%20${PORTVERSION}
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
