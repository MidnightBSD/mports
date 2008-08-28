# New ports collection makefile for:    jikes
# Date created:         09 December 1998
# Whom:                 Matthew Dillon <dillon@backplane.com>
#
# $MidnightBSD$
# $FreeBSD: ports/java/jikes/Makefile,v 1.46 2005/11/27 16:54:40 archie Exp $
#

PORTNAME=	jikes
PORTVERSION=	1.22
PORTREVISION=	1
CATEGORIES=	java
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=jikes/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A very fast Java source to byte-code compiler made available by IBM

MAN1=		jikes.1

PLIST_SUB=	PORTVERSION=${PORTVERSION}
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_BZIP2=	yes

CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" LIBS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
