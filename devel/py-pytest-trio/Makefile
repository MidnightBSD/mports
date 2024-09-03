PORTNAME=	pytest-trio
PORTVERSION=	0.8.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest plugin for trio
WWW=		https://pypi.org/project/pytest-trio/ \
		https://github.com/python-trio/pytest-trio

LICENSE=	mit apache2
LICENSE_COMB=	dual

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trio>=0:net/py-trio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}outcome>=0:devel/py-outcome@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils pytest
TEST_ARGS=	--pyargs pytest_trio
NO_ARCH=	yes

.include <bsd.port.mk>
