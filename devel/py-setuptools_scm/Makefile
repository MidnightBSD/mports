PORTNAME=	setuptools_scm
PORTVERSION=	6.4.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Setuptools plugin to manage your versions by scm tags

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomli>=1.0.0:textproc/py-tomli@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomli>=1.0.0:textproc/py-tomli@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

TEST_ENV=	_PYTEST_SESSION=yes

NO_ARCH=	yes
NO_TEST=	yes

# Skip integration tests that require a more recent version of py-virtualenv
post-extract:
	@${MV} ${WRKSRC}/testing/test_setuptools_support.py ${WRKSRC}/testing/test_setuptools_support.py.dist

post-patch:
	@${REINPLACE_CMD} -e 's|%%PYTHON_CMD%%|${PYTHON_CMD}|' ${WRKSRC}/testing/test_integration.py

.include <bsd.port.mk>
