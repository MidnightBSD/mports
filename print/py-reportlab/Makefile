PORTNAME=	reportlab
DISTVERSION=	5.0.1
CATEGORIES=	print python
MASTER_SITES=	PYPI:python \
	FREEBSD_LOCAL/bofh/print/py-${PORTNAME}:pfbfer
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:python \
	${PFBFER}:pfbfer
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to create PDF documents using the Python language
WWW=		https://www.reportlab.com/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pillow>=9.0.0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}charset-normalizer>=0:textproc/py-charset-normalizer@${PY_FLAVOR}

USES=		cpe python:3.11+
USE_PYTHON=	autoplist pep517

PFBFER_VERSION=	20180109
PFBFER=		pfbfer-${PFBFER_VERSION}.zip

MAKE_ENV=	PACKAGE_PATH="${REPORTLABDIR}"

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
NO_ARCH=	yes

REPORTLABDIR=	${PYTHONPREFIX_SITELIBDIR}/reportlab
PORTDOCS=	reportlab-userguide.pdf

OPTIONS_DEFINE=	CJK FREETYPE DOCS
OPTIONS_DEFAULT=CJK FREETYPE

CJK_DESC=	Adobe CMaps

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pillow>=9.0.0:graphics/py-pillow@${PY_FLAVOR}

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

post-install-DOCS-on:
	cd ${WRKSRC}/docs && ${PYTHON_CMD} genAll.py
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
