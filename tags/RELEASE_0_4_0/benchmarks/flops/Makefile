# $MidnightBSD: mports/benchmarks/flops/Makefile,v 1.2 2008/06/25 15:16:41 laffer1 Exp $

PORTNAME=	flops
PORTVERSION=	2.0
PORTREVISION=	1
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

post-patch:
	@${REINPLACE_CMD} -e \
		's|^void main|int main|' ${WRKSRC}/flops.c

do-build:
	(cd ${WRKSRC} && ${CC} ${CFLAGS} -DUNIX -o flops flops.c)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/flops ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/flops.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
