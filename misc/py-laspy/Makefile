PORTNAME=	laspy
DISTVERSION=	2.5.4
CATEGORIES=	misc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools to read/write LAS files with lidar data
WWW=		https://laspy.readthedocs.io/en/latest/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.16,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lazrs>=0.6.0:misc/py-lazrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}laszip>=0.2.1:archivers/py-laszip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyproj>0:graphics/py-pyproj@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=10.11.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typer>=0.8.0:devel/py-typer@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 concurrent autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
