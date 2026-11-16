PORTNAME=	rdflib
PORTVERSION=	7.6.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for RDF manipulation
WWW=		https://github.com/RDFLib/rdflib

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.4.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyparsing>=2.1.0:devel/py-pyparsing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyparsing<4:devel/py-pyparsing@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}berkeleydb>=0:databases/py-berkeleydb@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}networkx>=2,1:math/py-networkx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}networkx<4,1:math/py-networkx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-subtests>=0:devel/py-pytest-subtests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tabulate>=0:devel/py-tabulate@${PY_FLAVOR}

USES=		cpe python:3.9+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

CPE_VENDOR=	rdflib_project

OPTIONS_DEFINE=	HTML
OPTIONS_DEFAULT=	HTML
HTML_DESC=	HTML support

HTML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}html5rdf>=1.2:www/py-html5rdf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}html5rdf<2:www/py-html5rdf@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}isodate>=0.7.2:devel/py-isodate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}isodate<1.0.0:devel/py-isodate@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} >= 31000
TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}httpx>=0.28.1:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx<0.29:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testcontainers>=4.13.2:devel/py-testcontainers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testcontainers<5:devel/py-testcontainers@${PY_FLAVOR}
.endif

do-test:
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -k '${_PYTEST_FILTER_EXPRESSION}' -ra --tb=native -m 'not testcontainer' ${TEST_ARGS:NDESTDIR=*}

.include <bsd.port.post.mk>
