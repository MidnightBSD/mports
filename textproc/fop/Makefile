PORTNAME=	fop
DISTVERSION=	2.8
PORTREVISION=	1
CATEGORIES=	textproc java
MASTER_SITES=	APACHE/xmlgraphics/fop/source/:fop \
		SF/offo/offo-hyphenation/2.2:hyph \
		https://archive.apache.org/dist/xmlgraphics/fop/source/:fop
DISTNAME=	${PORTNAME}-${PORTVERSION}-src
DISTFILES=	${DISTNAME}.tar.gz:fop offo-hyphenation.zip:hyph
EXTRACT_ONLY=	${DISTNAME}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Print formatter driven by XSL formatting
WWW=		https://xmlgraphics.apache.org/fop/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

EXTRACT_DEPENDS=	${UNZIP_CMD}:archivers/unzip

USES=		java:ant,run

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
PORTDOCS=	*
NO_ARCH=	yes

BUILD_WRKSRC=	${WRKSRC}/fop
WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}

OPTIONS_DEFINE=	DOCS

post-extract:
	@cd ${WRKDIR} && ${UNZIP_CMD} ${DISTDIR}/offo-hyphenation.zip
	@${CP} ${WRKDIR}/offo-hyphenation/hyph/*.xml ${BUILD_WRKSRC}/hyph

do-install:
.for d in build conf lib
	@${MKDIR} ${STAGEDIR}${DATADIR}/${d}
.endfor
	@cd ${BUILD_WRKSRC} && \
	    ${INSTALL_DATA} build/*.[jw]ar ${STAGEDIR}${DATADIR}/build && \
	    ${INSTALL_DATA} lib/*.jar lib/README.txt ${STAGEDIR}${DATADIR}/lib && \
	    ${INSTALL_DATA} conf/fop.xconf ${STAGEDIR}${DATADIR}/conf && \
	    ${COPYTREE_SHARE} hyph ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${BUILD_WRKSRC}/${PORTNAME} ${STAGEDIR}${DATADIR}
	${LN} -s ../${DATADIR_REL}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} README NOTICE KEYS ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
