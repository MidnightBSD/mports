# New ports collection makefile for:	libart
# Date created:		8 July 2001
# Whom:			Hye-Shik Chang <perky@python.or.kr>
#
# $MidnightBSD: mports/graphics/libart/Makefile,v 1.1 2008/10/20 01:16:24 laffer1 Exp $
# $FreeBSD: ports/graphics/libart/Makefile,v 1.10 2007/02/01 02:41:40 kris Exp $
#

PORTNAME=	libart
PORTVERSION=	2.3.3
CATEGORIES=	graphics
MASTER_SITES=	http://tiger.bioinf.cs.uni-potsdam.de/free/Graphics/ \
		http://cvsup.theplanet.com/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for high-performance 2D graphics
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
WRKSRC=		${WRKDIR}/${PORTNAME}_lgpl-${PORTVERSION}
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFLICTS=	libart_lgpl-*

.include <bsd.port.mk>
