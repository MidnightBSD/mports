# New ports collection makefile for:	cvstrac
# Date created:				29 August 2002
# Whom:					Bruce M Simpson <bms@spc.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/cvstrac/Makefile,v 1.10 2007/04/02 16:48:47 rafan Exp $
#

PORTNAME=	cvstrac
PORTVERSION=	2.0.0
CATEGORIES=	devel
MASTER_SITES=	http://www.cvstrac.org/
DISTNAME=	${PORTNAME}-${PORTVERSION}

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-Based Bug And Patch-Set Tracking System For CVS
LICENSE=	gpl2

USE_SQLITE=	yes

USE_GMAKE=	yes

MAKE_ARGS=	SRCDIR=${WRKSRC} PREFIX=${PREFIX} LOCALBASE=${LOCALBASE}

NOMAN=
PLIST_FILES=	bin/cvstrac

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cvstrac ${PREFIX}/bin

.include <bsd.port.mk>
