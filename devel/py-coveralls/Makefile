PORTNAME=	coveralls
PORTVERSION=	4.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Show coverage stats online via coveralls.io
WWW=		https://github.com/TheKevJames/coveralls-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=5.0<8.0:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=1.0.0<3.0.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typer>=0.12.0<1.0.0:devel/py-typer@${PY_FLAVOR} \
		${PY_TOMLI}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

USE_GITHUB=	nodefault
GH_TUPLE=	TheKevJames:coveralls-python:7dbb2c46709c1da3d730dfd926de5994f942e19d:tests

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}responses>=0.26.0:devel/py-responses@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=3.10<7.0:devel/py-pyyaml@${PY_FLAVOR} \
		git:devel/git

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

post-extract:
	${CP} -R ${WRKSRC_tests}/tests ${WRKSRC}/tests
	${CP} -R ${WRKSRC_tests}/example ${WRKSRC}/example
	${CP} -R ${WRKSRC_tests}/nonunicode ${WRKSRC}/nonunicode

.include <bsd.port.mk>
