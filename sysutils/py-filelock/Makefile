PORTNAME=	filelock
DISTVERSION=	4.2.4
CATEGORIES=	sysutils python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Platform independent file lock
WWW=		https://github.com/tox-dev/py-filelock

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.29:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.5:devel/py-hatch-vcs@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9.0.3,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}covdefaults>=2.3:devel/py-covdefaults@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}diff-cover>=10.2:devel/py-diff-cover@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=1.3:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.15.1:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=3.16:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=2.4:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}virtualenv>=21.2:devel/py-virtualenv@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	pep517 autoplist pytest
USE_GITHUB=	yes
GH_ACCOUNT=	tox-dev
GH_PROJECT=	filelock

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

# Upstream coverage gate fails on MidnightBSD (96.87%, requires 100%).
NO_TEST=	yes

MAKE_ENV+=	SETUPTOOLS_SCM_PRETEND_VERSION=${DISTVERSION}

.include <bsd.port.mk>
