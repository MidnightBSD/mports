PORTNAME=	base58
PORTVERSION=	2.1.1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitcoin-compatible Base58 and Base58Check implementation
WWW=		https://pypi.org/project/base58/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}PyHamcrest>0:textproc/py-pyhamcrest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-benchmark>0:devel/py-pytest-benchmark@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils pytest

TEST_ENV=	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ARGS=	-p pytest_benchmark.plugin --benchmark-disable

NO_ARCH=	yes

.include <bsd.port.mk>
