# New ports collection makefile for:	libuninameslist
# Date created:				3 November 2003
# Whom:					KANOU Hiroki <kanou@khdd.net>
#
# $MidnightBSD: mports/textproc/libuninameslist/Makefile,v 1.2 2007/04/26 03:35:55 ctriv Exp $ 
# $FreeBSD: ports/textproc/libuninameslist/Makefile,v 1.4 2006/04/08 17:18:35 mnag Exp $
#

PORTNAME=	libuninameslist
PORTVERSION=	20060907
CATEGORIES=	textproc
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}_src-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library of Unicode annotation data
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GNOME=	gnometarget
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
ALL_TARGET=	both
USE_LDCONFIG=	yes

.include <bsd.port.mk>
