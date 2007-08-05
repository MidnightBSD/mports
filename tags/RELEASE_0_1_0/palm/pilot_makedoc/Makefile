# New ports collection makefile for:	pilot_makedoc
# Date created:				May 10th 1997
# Whom:					jfitz@FreeBSD.org
#
# $FreeBSD: ports/palm/pilot_makedoc/Makefile,v 1.17 2004/02/06 13:12:13 trevor Exp $
# $MidnightBSD$
#

PORTNAME=	pilot_makedoc
PORTVERSION=	0.7a
PORTREVISION=	1
CATEGORIES=	palm textproc
MASTER_SITES=	ftp://ftp.forth.org/pub/PalmOS/ \
		ftp://ftp.cs.tu-berlin.de/pub/palmtops/pilot/
DISTNAME=	makedoc7
EXTRACT_SUFX=	.cpp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts text into the Doc format used by PalmPilots

NO_WRKSUBDIR=	YES
PLIST_FILES=	bin/pilot_makedoc
ALL_TARGET=	pilot_makedoc

do-extract:
		@${MKDIR} ${WRKDIR}
		@${CP} ${DISTDIR}/${DISTFILES} ${WRKDIR}
		@${CP} ${FILESDIR}/Makefile ${WRKDIR}

do-install:
		@${INSTALL_PROGRAM} ${WRKDIR}/pilot_makedoc ${PREFIX}/bin

.include <bsd.port.mk>
