# New ports collection makefile for:	gzrecover
# Date created:				3 June 2005
# Whom:					Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD: mports/archivers/gzrecover/Makefile,v 1.1 2006/09/17 23:58:02 laffer1 Exp $
# $FreeBSD: ports/archivers/gzrecover/Makefile,v 1.6 2006/09/07 15:37:57 ehaupt Exp $
#

PORTNAME=	gzrecover
PORTVERSION=	0.5
CATEGORIES=	archivers
MASTER_SITES=	http://www.urbanophile.com/arenn/hacking/gzrt/ \
		http://critical.ch/distfiles/ \
		http://energy.critical.ch/distfiles/
DISTNAME=	gzrt-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gzip recovery toolkit
LICENSE=	gpl2

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
