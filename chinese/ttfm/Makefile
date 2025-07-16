PORTNAME=	ttfm
PORTVERSION=	0.9.5
PORTREVISION=	0
CATEGORIES=	chinese print
MASTER_SITES=	FREEBSD_LOCAL/rafan/chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Big5/GB enhanced TrueType Font Manager

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		pkgconfig

MAKE_ARGS=	FREETYPE_BASE=${LOCALBASE:Q} CC="${CC}"

PORTDOCS=	README USAGE

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,%%LOCALBASE%%,${LOCALBASE},' \
		-e 's,%%PREFIX%%,${PREFIX},' \
		${WRKSRC}/modules/gscjk.ttfm \
		${WRKSRC}/modules/xttfm.ttfm \
		${WRKSRC}/ttfm.sh

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ttfinfo ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/ttfm.sh ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/ttfm.sh.1 ${STAGEDIR}${PREFIX}/share/man/man1/
	@${MKDIR} ${STAGEDIR}${DATADIR}
.for module in gscjk.ttfm xttfm.ttfm
	${INSTALL_SCRIPT} ${WRKSRC}/modules/${module} ${STAGEDIR}${DATADIR}/
.endfor

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

.include <bsd.port.mk>
