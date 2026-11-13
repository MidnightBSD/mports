PORTNAME=	enrich
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.0
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensions to py-rich
WWW=		https://github.com/pycontribs/enrich

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=7.0.5:devel/py-setuptools-scm@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.7.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=1.29.0:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.3.1:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-plus>=0:devel/py-pytest-plus@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}rich>=10.0.0<16.0.0:textproc/py-rich@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	pep517 autoplist pytest

USE_GITHUB=	yes
GH_ACCOUNT=	pycontribs

TEST_ARGS=	--doctest-modules --durations 10 --durations-min=3 --color=yes
NO_ARCH=	yes

MAKE_ENV=	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_ENRICH=${DISTVERSION}

.include <bsd.port.mk>
