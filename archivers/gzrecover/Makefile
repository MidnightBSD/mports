# $MidnightBSD: mports/archivers/gzrecover/Makefile,v 1.2 2008/03/12 01:38:10 laffer1 Exp $

PORTNAME=	gzrecover
PORTVERSION=	0.5
CATEGORIES=	archivers
MASTER_SITES=	http://www.urbanophile.com/arenn/hacking/gzrt/ \
		CRITICAL
DISTNAME=	gzrt-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gzip recovery toolkit
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes
CFLAGS+=	-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -lz

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README

do-build:
	${CC} -o ${WRKSRC}/${PORTNAME} ${CFLAGS} ${WRKSRC}/${PORTNAME}.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${TARGETDIR}/bin
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
