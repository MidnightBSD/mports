# Created by: Thomas Gellekum <tg@FreeBSD.org>

PORTNAME=	reportlab
PORTVERSION=	3.5.60
PORTREVISION=	1
CATEGORIES=	print python
MASTER_SITES=	PYPI \
		https://www.reportlab.com/ftp/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PFBFER}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to create PDF documents using the Python language

LICENSE=	bsd3

BUILD_DEPENDS+=	${PY_PILLOW}
RUN_DEPENDS=	${PY_PILLOW}

USES=		python
USE_PYTHON=	distutils autoplist

CONFLICTS=	py*-reportlab[^3]-[^3].* \
		py*-reportlab-[^3].*

PFBFER_VERSION=	20180109
PFBFER=		pfbfer-${PFBFER_VERSION}.zip

MAKE_ENV=	PACKAGE_PATH="${REPORTLABDIR}"

REPORTLABDIR=	${PYTHONPREFIX_SITELIBDIR}/reportlab
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
PORTDOCS=	reportlab-userguide.pdf

OPTIONS_DEFINE=	CJK FREETYPE DOCS
OPTIONS_DEFAULT=CJK FREETYPE
# XXX disable this 20190809 while linimon investigates why having it
# enabled consumes all memory and swap during poudriere builds.
OPTIONS_EXCLUDE_powerpc64=	DOCS
CJK_DESC=	Adobe CMaps
CJK_RUN_DEPENDS=	${LOCALBASE}/share/fonts/adobe-cmaps/ac15/cid2code.txt:print/adobe-cmaps
FREETYPE_LIB_DEPENDS=	libfreetype.so:print/freetype2

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%DISTDIR%%|${DISTDIR}|' \
			  -e 's|%%PFBFER%%|${PFBFER}|' \
				${WRKSRC}/setup.py

post-patch-DOCS-on:
.for f in genAll.py userguide/genuserguide.py
	@${REINPLACE_CMD} -e 's|%%FAKE_DESTDIR%%|${FAKE_DESTDIR}|' \
			  -e 's|%%PYTHON_SITELIBDIR%%|${PYTHON_SITELIBDIR}|' \
				${WRKSRC}/docs/${f}
.endfor

post-install:
	-${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/reportlab/*/*.so

post-install-DOCS-on:
	cd ${WRKSRC}/docs && ${PYTHON_CMD} genAll.py
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
