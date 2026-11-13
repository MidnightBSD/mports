PORTNAME=	pytest-expect
PORTVERSION=	1.1.0
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest plugin for stored test expectations
WWW=		https://github.com/gsnedders/pytest-expect

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}u-msgpack-python>=0:devel/py-u-msgpack-python@${PY_FLAVOR}

USES=		python
USE_GITHUB=	yes
GH_ACCOUNT=	gsnedders
# The release sdist omits LICENSE; use the exact 1.1.0 release commit.
GH_TAGNAME=	875e9e4edef64397d997c597c815763f42efe240
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
