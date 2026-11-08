PORTNAME=	forbiddenfruit
PORTVERSION=	0.1.5
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Patch python built-in objects
WWW=		https://clarete.li/forbiddenfruit/ \
		https://github.com/clarete/forbiddenfruit

LICENSE=	gpl3+ mit
LICENSE_COMB=	dual
LICENSE_FILE_gpl3+ =	${WRKSRC}/COPYING
LICENSE_FILE_mit=	${WRKSRC}/COPYING.mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

USE_GITHUB=	yes

GH_ACCOUNT=	clarete

# Build upstream's C fixture only for the test suite, as in its CI.
pre-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} FFRUIT_EXTENSION=true \
		${PYTHON_CMD} setup.py build_ext --build-lib tests/unit

.include <bsd.port.mk>
