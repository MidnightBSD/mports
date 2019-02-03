# $MidnightBSD$
# $FreeBSD: ports/benchmarks/iozone/Makefile,v 1.48 2007/01/11 21:37:25 erwin Exp $

PORTNAME=	iozone
DISTVERSION=	3.457
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

PLIST_FILES=	bin/iozone

OPTIONS_DEFINE=	SSH THREADS
OPTIONS_DEFAULT=SSH THREADS

SSH_DESC=	Use ssh in distributed measurement
THREADS_DESC=	Enable threading (uses pthreads)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MTHREADS}
CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}
.else
CFLAGS+=	-DNO_THREADS
.endif

post-patch:
.if ${PORT_OPTIONS:MSSH}
	@${REINPLACE_CMD} -e 's|shell\,\"rsh\"|shell\,\"ssh\"|' ${WRKSRC}/iozone.c
.endif
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/iozone ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/iozone.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
