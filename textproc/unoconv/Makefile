PORTNAME=	unoconv
PORTVERSION=	0.7
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	http://dag.wieers.com/home-made/${PORTNAME}/ \
		SF/nemysisfreebsdp/textproc/:icons
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}.png:icons
DIST_SUBDIR=	python
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert any document from and to any LibreOffice supported format
WWW=		http://dag.wieers.com/home-made/unoconv/

LICENSE=	gpl2

RUN_DEPENDS=	xsltproc:textproc/libxslt

USES=		python
NO_BUILD=	yes

PORTDOCS=	*

DOC_FILES=	AUTHORS ChangeLog README.adoc
DOC_FILES2=	errcode.adoc filters.adoc formats.adoc \
		office-installations.adoc selinux.adoc unoconv.1.adoc

OPTIONS_DEFINE=	DOCS

SUB_FILES=	${PORTNAME} pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|${PYTHON_CMD}|' \
		${WRKSRC}/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${PREFIX}/bin/
	@${MKDIR} ${DATADIR}/tests/
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${DATADIR}
.for f in *.odt *.csv
	@(cd ${WRKSRC}/tests && ${INSTALL_DATA} ${f} ${DATADIR}/tests)
.endfor
	${INSTALL_DATA} ${_DISTDIR}/${PORTNAME}.png \
		${PREFIX}/share/pixmaps/
	${INSTALL_MAN} ${WRKSRC}/doc/${PORTNAME}.1 \
		${PREFIX}/share/man/man1/

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOC_FILES:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOC_FILES2:S|^|${WRKSRC}/doc/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
