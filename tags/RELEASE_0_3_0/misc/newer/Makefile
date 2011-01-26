# $MidnightBSD: mports/misc/newer/Makefile,v 1.1 2008/03/24 22:16:09 laffer1 Exp $

PORTNAME=	newer
PORTVERSION=	1.0
CATEGORIES=	misc
MASTER_SITES=	ftp://ftp.cwru.edu/pub/chet/
DISTFILES=	newer.c
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of AT&T Research UNIX V8 newer(1)
LICENSE=	publicdom

CONFLICTS=	teTeX-base-[0-9]* tex-[0-9]*

PLIST_FILES=	bin/newer
NO_EXTRACT=	yes

do-build:
	${CP} ${DISTDIR}/newer.c ${WRKDIR}/newer.c
	${CC} ${CFLAGS} -o ${WRKDIR}/newer ${WRKDIR}/newer.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/newer ${PREFIX}/bin

.include <bsd.port.mk>
