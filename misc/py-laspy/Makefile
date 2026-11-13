PORTNAME=	laspy
DISTVERSION=	2.7.0
CATEGORIES=	misc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools to read/write LAS files with lidar data
WWW=		https://laspy.readthedocs.io/en/latest/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.16,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lazrs>=0.8.0<0.9.0:misc/py-lazrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}laszip>=0.3.0<0.4.0:archivers/py-laszip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyproj>0:graphics/py-pyproj@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=10.11.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typer>=0.16.0:devel/py-typer@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONSAFEPATH=1 PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	${WRKSRC}/tests --import-mode=importlib

.include <bsd.port.mk>
