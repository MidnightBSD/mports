# $MidnightBSD$

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
LICENSE=	unknown

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
