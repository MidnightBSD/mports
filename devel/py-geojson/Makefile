PORTNAME=	geojson
PORTVERSION=	3.3.0
PORTEPOCH=	1
CATEGORIES=	devel geography python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python's Encoder/decoder for simple GIS features
WWW=		https://pypi.org/project/geojson/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}simplejson>1.9:devel/py-simplejson@${PY_FLAVOR}

USES=		python:3.10-3.14
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes
PORTDOCS=	LICENSE.rst CHANGELOG.rst README.rst

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -c 'import sys; sys.path.pop(0); import geojson, runpy; print("Testing", geojson.__file__, flush=True); runpy.run_module("unittest", run_name="__main__")' discover -s ${WRKSRC}/tests -v

.include <bsd.port.mk>
