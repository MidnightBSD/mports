PORTNAME=	twitter
PORTVERSION=	1.19.6
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	net python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-tools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API and command-line toolset for Twitter (twitter.com)
WWW=		https://github.com/sixohsix/twitter

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=8.1.0<9:devel/py-setuptools-scm8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}certifi>0:security/py-certifi@${PY_FLAVOR}

USES=		python:3.8+
USE_GITHUB=	yes
GH_ACCOUNT=	sixohsix
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
# The full upstream suite posts to a live Twitter account.
NO_TEST=	yes

_TWITTER_SCM_PATH?=	${PYTHON_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${_TWITTER_SCM_PATH} \
		SETUPTOOLS_SCM_PRETEND_VERSION_FOR_TWITTER=${PORTVERSION}
TEST_ARGS=	--cov twitter --cov tests --cov-report=xml

.include <bsd.port.mk>
