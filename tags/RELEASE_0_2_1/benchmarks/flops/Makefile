# New ports collection makefile for:	flops
# Date created:				06 Jul 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD: mports/benchmarks/flops/Makefile,v 1.1 2007/05/19 23:41:17 laffer1 Exp $
# $FreeBSD: ports/benchmarks/flops/Makefile,v 1.2 2006/09/07 10:42:35 danfe Exp $
#

PORTNAME=	flops
PORTVERSION=	2.0
CATEGORIES=	benchmarks
MASTER_SITES=	http://mbsd.msk.ru/dist/
DISTFILES=	${PORTNAME}.c ${PORTNAME}.doc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Floating point benchmark to give your MFLOPS rating
LICENSE=	unknown

PLIST_FILES=	bin/flops

.if !defined(NOPORTDOCS)
PORTDOCS=	flops.doc
.endif

do-extract: .SILENT
	${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/flops.c ${DISTDIR}/flops.doc ${WRKSRC}

do-build:
	(cd ${WRKSRC} && ${CC} ${CFLAGS} -DUNIX -o flops flops.c)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/flops ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/flops.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
