# New ports collection makefile for:	libuninameslist
# Date created:				3 November 2003
# Whom:					KANOU Hiroki <kanou@khdd.net>
#
# $MidnightBSD$ 
# $FreeBSD: ports/textproc/libuninameslist/Makefile,v 1.4 2006/04/08 17:18:35 mnag Exp $
#

PORTNAME=	libuninameslist
PORTVERSION=	20050712
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	libuninameslist
DISTNAME=	${PORTNAME}_src-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library of Unicode annotation data

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
ALL_TARGET=	both

.include <bsd.port.mk>
