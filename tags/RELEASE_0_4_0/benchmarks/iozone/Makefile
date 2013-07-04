# New ports collection makefile for:    iozone
# Date created:         26 September 1994
# Whom:                 jmz
#
# $MidnightBSD: mports/benchmarks/iozone/Makefile,v 1.4 2008/08/22 14:49:22 laffer1 Exp $
# $FreeBSD: ports/benchmarks/iozone/Makefile,v 1.48 2007/01/11 21:37:25 erwin Exp $
#

PORTNAME=	iozone
PORTVERSION=	3.397
CATEGORIES=	benchmarks
MASTER_SITES=	http://www.iozone.org/src/current/
DISTNAME=	${PORTNAME}${PORTVERSION:S/./_/}
EXTRACT_SUFX=	.tar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Sequential File I/O
LICENSE=	unknown

CONFLICTS=	iozone-2.*

WRKSRC=		${WRKDIR}/${DISTNAME}/src/current

MAKEFILE=	makefile
MAKE_ARGS=	${MAKE_ENV}
ALL_TARGET=	freebsd
MAKE_JOBS_UNSAFE=	yes

MAN1=		iozone.1
PLIST_FILES=	bin/iozone

OPTIONS=	THREADS "Enable threading (uses pthreads)"	on \
		SSH "Use SSH in Distributed environment"	on

.include <bsd.port.pre.mk>

.if defined (WITH_THREADS)
CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}
.else
CFLAGS+=	-DNO_THREADS
.endif

post-patch:
.if defined (WITH_SSH)
	${REINPLACE_CMD} -e 's|shell\,\"rsh\"|shell\,\"ssh\"|' ${WRKSRC}/iozone.c
.endif
	${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/iozone ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/iozone.1 ${PREFIX}/man/man1

.include <bsd.port.post.mk>
